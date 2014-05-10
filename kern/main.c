
#include <bwio.h>
#include <iolib.h>
#include <ts7200.h>
#include <clock.h>
#include <niklib.h>
#include <terminal.h>

#include <parse.h>
#include <train.h>

#define COMMAND_SIZE 75
#define ARGUMENT_CACHE_SIZE 5

unsigned int running = 0;
unsigned int print_label = 0;

unsigned int arg[ARGUMENT_CACHE_SIZE] = {0};
unsigned int switch_index = 0;
unsigned int switches[10] = {0};

int inc_switchread() {
    if ( switch_index == 9 ){
        switch_index = 0;
        return -1;
    }
    switch_index++;
    return 0;
}


int init() {
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
    result = train_start();

    bwprintf( COM2, "Clearing Switch Data\n" );
    bwputc( COM1, 192 );
    bwprintf( COM2, "Train Setup Success!!!!\n" );

    result = term_init();
    if( result ) return 3;
    
    running = 1;
    print_label = 1;
    switch_index = 0;

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
        printf( "REVERSE %d\n", arg[0] );
        break;
    case QUIT:
        running = 0;
        print_label = 0;
        printf( "SHUTTING DOWN\n" );
        break;
    default:
        printf( "UNKNOWN COMMAND\n" );
        break;
    }

    return 0;
}

unsigned int getSwitchName( int bank, int off ) {
    unsigned int result;

    if ( bank % 2 ) result = off+8;
    else result = off;

    result = result << 8;
    if( bank < 0 )  return 0;
    else if( bank < 2 )  result |= 'A';
    else if( bank < 4 )  result |= 'B';
    else if( bank < 6 )  result |= 'C';
    else if( bank < 8 )  result |= 'D';
    else if( bank < 10 ) result |= 'E';

    return result;
}


int main( int argc, char* argv[] ) {
    unsigned int i;
    unsigned int secs = 0;
    unsigned int mins = 0;
    unsigned int tenths = 0;

    unsigned int inputloc = 0;
    char command[COMMAND_SIZE+1];

    for( i = 0 ; i < COMMAND_SIZE+1; i++ ) {
        command[i] = '\0';
    }

    int result = init();
    if( result ) {
        return result;
    }

    while( running ) {
        result = io_poll();
        if( result >> 2 ) {
            char c;
            if( !getc( &c ) && c != 0x1B ) {
                putc( c );
                command[inputloc++] = c;

                switch( c ) {
                case '\b': 
                    putc( ' ' );
                  if( inputloc == 0 ) break;
                    putc( '\b' );
                    inputloc -= 2;
                  break;
                case '\r':
                    print_label = 1;
                    command[inputloc] = '\0';
                    run_command( command );
                    inputloc = 0;
                  break;
                }
            }
            if( inputloc == COMMAND_SIZE ) {
                inputloc--;
                putc( '\b' ); 
            }
        }
        if( result & 3 ) {
            char c; 
            if( !gettrain( &c ) ) {
                savecur();
                if( switches[switch_index] != c ) {
                    int mask = 1;
                    setpos( 7, 4 );
                    for( i = 8; i > 0; i--) {
                        if( (c & mask) > (switches[switch_index] & mask) ) {
                            unsigned int swit = getSwitchName( switch_index, i ); 
                            printf( "%c%d ", swit, swit >> 8 );
                        }
                        mask = mask << 1;
                    }
                    switches[switch_index] = c;
                }

                if( inc_switchread() ) {
                    setpos( 8, 4 );
                    do {
                        printf( "%d ", switches[switch_index] );
                    } while( !inc_switchread() );
                }
                loadcur();
            }
        }
            
        result = clock_poll();
        if( result > 0 ) {
            clock_get( &mins, &secs, &tenths );

            savecur();
            setpos( 0, 0 );
            printf( "%d %d %d\n\r", mins, secs, tenths );
            loadcur();

            train_askdump();
        }
        
        if( print_label ) {
            printf( "TERM> " );
            print_label = 0;
        }
    }

    term_destroy();
	return 0;
}

