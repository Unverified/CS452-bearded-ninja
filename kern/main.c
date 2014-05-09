
#include <bwio.h>
#include <iolib.h>
#include <ts7200.h>
#include <clock.h>

#include <parse.h>
#include <train.h>

#define COMMAND_SIZE 75

int running = 0;
int print_label = 0;
int arg[5] = {0};

void bwcls() {
    bwprintf( COM2, "%c[2J", 0x1b );
}

void bwsetpos( int col, int row ) {
    bwprintf( COM2, "%c[%d;%dH", 0x1b, col, row );
}

void cls() {
    printf( "\x1b[2J" );
}

void setpos( int col, int row ) {
    printf( "\x1b[%d;%dH", col, row );
}

void savecur() {
    printf( "\x1b[s" );
}

void loadcur() {
    printf( "\x1B[u" );
}

int init() {
    bwcls();
    bwsetpos( 0, 0 );
    bwprintf( COM2, "Booting up NIK os\n\r" ); 
    
    int result = io_init();
    if( result ) return 1;
    bwprintf( COM2, "io setup success!!!!\n" );
    
    result = clock_init();
    if( result ) return 2;
    bwprintf( COM2, "clock setup success!!!!\n" );

    train_start();

    running = 1;
    print_label = 1;
    return 0;
}

int run_command( char command[] ) {
    switch( parse_command( command, arg ) ) {
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
    bwcls();

    while( running ) {
        result = clock_poll();
        if( result > 0 ) {
            clock_get( &mins, &secs, &tenths );

            savecur();
            setpos( 0, 0 );
            printf( "%d %d %d\n\r", mins, secs, tenths );
            loadcur();
        }

        result = io_poll();
        if( result ) {
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
        if( print_label ) {
            printf( "TERM> " );
            print_label = 0;
        }
    }
	return 0;
}

