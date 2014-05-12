
#include <bwio.h>
#include <iolib.h>
#include <ts7200.h>
#include <clock.h>
#include <niklib.h>
#include <terminal.h>
#include <debug.h>

#include <parse.h>
#include <train.h>

#define COMMAND_SIZE 75
#define ARGUMENT_CACHE_SIZE 5
#define SWITCH_BUFFER_SIZE 14


unsigned int running = 0;
unsigned int print_label = 0;

unsigned int arg[ARGUMENT_CACHE_SIZE] = {0};

unsigned int switch_index = 0;
unsigned int switches[10] = {0};

unsigned int switch_head = 0;
static struct SwitchName trippedSwitches[SWITCH_BUFFER_SIZE];

int inc_switchread() {
    if ( switch_index == 9 ){
        switch_index = 0;
        return -1;
    }
    switch_index++;
    return 0;
}

int inc_switchstore() {
    if( switch_head == SWITCH_BUFFER_SIZE - 1 ) {
        trippedSwitches[switch_head = 0].bank = '\0';
        return -1;
    }
    trippedSwitches[++switch_head].bank = '\0';
    return 0;
}

int init() {
    int i;
    char c;

    int result = io_init();
    if( result ) return 1;

    bwcls();
    bwsetpos( 0, 0 );
    bwprintf( COM2, "Booting up NIK OS (R) V0.0.123b alpha beta\n\r" ); 

    bwprintf( COM2, "Setting up Clock\n" );
    result = clock_init();
    if( result ) return 2;
    bwprintf( COM2, "clock setup success!!!!\n" );

    bwprintf( COM2, "Setting up Trainset\n" );
    result = train_init();
    bwprintf( COM2, "Train Setup Success!!!!\n" );

    result = term_init();
    if( result ) return 3;

    gettrain( &c );
    switch_index = 0;
    switch_head = 0;

    bwputc( COM1, 133 );
    do {
        switches[switch_index] = bwgetc( COM1 );
    } while( !inc_switchread() );

    running = 1;
    print_label = 1;
    for( i = 0; i < SWITCH_BUFFER_SIZE; i++ ){
        trippedSwitches[i].bank = '\0';
    }

    return 0;
}

int run_command( char command[] ) {
    switch( parse_command( command, (int*)arg ) ) {
    case NONE:
        break;
    case SPEED:
        return train_setspeed( arg[0], arg[1] );
    case GATE:
        return train_setgate( arg[0], arg[1] );
    case REVERSE:
        train_reverse( arg[0] );
        break;
    case QUIT:
        running = 0;
        print_label = 0;
        printf( "SHUTTING DOWN\n" );
        break;
    default:
        printf( "UNKNOWN COMMAND:\n" );
        printf( command );
        break;
    }

    return 0;
}

int getSwitchName( int bank, int off, struct SwitchName *swdata) {
    if( bank < 0 || bank > 10 ) return -1;
    swdata->bank = 'A' + (bank / 2);
    swdata->num = off + 8 * (bank % 2);

    return 0;
}

int printSwitchName( const struct SwitchName *swdata ) {
    if( swdata->num < 10 ) {
        printf( "%c0%d", swdata->bank, swdata->num );
    } else {
        printf( "%c%d", swdata->bank, swdata->num );
    }
    return 0;
}

void printTrippedSwitchs( ) {
    int i = switch_head - 1;
    
    for( ; ; i--) {
        if( i < 0 ) i = SWITCH_BUFFER_SIZE-1;
        if( trippedSwitches[i].bank == '\0' ) return;
        printSwitchName( &trippedSwitches[i] );

        putc( ' ' );
    }
}

int main( int argc, char* argv[] ) {
    char c;
    unsigned int i;

    unsigned int secs = 0;
    unsigned int mins = 0;
    unsigned int tenths = 0;
    unsigned int inputloc = 0;
    unsigned int update = 0;
    unsigned int request = 1;

    char command[COMMAND_SIZE+1];
    for( i = 0 ; i < COMMAND_SIZE+1; i++ ) {
        command[i] = '\0';
    }

    int result = init();
    if( result ) {
        return result;
    }

//    debug_init();
    while( running ) {
//        debug_loop();

        result = io_poll();
        if( result >> 2 ) {
            if( !getc( &c ) && c != 0x1B ) {
                switch( c ) {
                case '\b':
                  if( inputloc == 0 ) break;
                    putc( '\b' );
                    putc( ' ' );
                    putc( '\b' );
                    command[--inputloc] = '\0';
                  break;
                case '\r':
                    putc( c );
                    command[inputloc++] = c;
                    print_label = 1;
                    command[inputloc] = '\0';
                    run_command( command );
                    inputloc = 0;
                  break;
                default:
                    if( inputloc == COMMAND_SIZE-1 ) {
                        putc( '\b' );
                    } else { 
                        inputloc++;
                    }

                    putc( c );
                    command[inputloc-1] = c;
                }
            }
        }

        if( result & 3 ) {
            if( !gettrain( &c ) ) {
                //debug_responce();

                savecur();
                if( switches[switch_index] != c ) {
                    i = 1;
                    int mask;
                    for( mask = 0x80; mask > 0; mask = mask >> 1 ){
                        if( (c & mask) > (switches[switch_index] & mask) ) {
                            getSwitchName( switch_index, i, &trippedSwitches[switch_head] );
                            inc_switchstore();
                            update = 1;
                        }
                        i ++;
                    }
                    switches[switch_index] = c;
                    
                    if( update ) {
                        setpos( 9, 6 );
                        printTrippedSwitchs();
                        update = 0; 
                    }
                }
                if( inc_switchread() ) {
                    request = 1;
                    //debug_allresponces();
                }
                loadcur();
            }
        }
            
        result = clock_poll();
        if( result > 0 ) {
            clock_get( &mins, &secs, &tenths );

            savecur();
            setpos( 0, 7 );
            printf( "%d:%d.%d", mins, secs, tenths );
//            debug_print();
            loadcur();

            result = train_poll();
        }

        if( request ) {
            train_askdump();
            //debug_pollsent();
            request = 0;
        }
        
        if( print_label ) {
            printf( "TERM> " );
            print_label = 0;
        }

    }

    term_destroy();
	return 0;
}

