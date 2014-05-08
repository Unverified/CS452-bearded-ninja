
#include <bwio.h>
#include <iolib.h>
#include <ts7200.h>
#include <clock.h>

#include <train.h>

#define TRAIN 47
#define COMMAND_SIZE 80

void train_dance( int secs ) {
    switch ( secs ) {
    case 5:
        train_setspeed( TRAIN, 5 );
        break;
    case 10:
        train_setspeed( TRAIN, 10 );
        break;
    case 20:
        train_setspeed( TRAIN, 16 );
        break;
    case 30:
        train_setspeed( TRAIN, 14+16 );
        break;
    case 40:
        train_setspeed( TRAIN, 14 );
        break;
    case 50:
        train_setspeed( TRAIN, 5 );
        break;
    case 55:
        train_setspeed( TRAIN, 15 );
        break;
    default:
        break;
    }
}

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
    bwprintf( COM2, "io setup success!!!!\n\r" );
    
    result = clock_init();
    if( result ) return 2;
    bwprintf( COM2, "clock setup success!!!!\n\r" );

//    train_start();

    return 0;
}

int main( int argc, char* argv[] ) {
    unsigned int i;
    unsigned int tenths = 0;
    unsigned int secs = 0;
    unsigned int mins = 0;

    char inputloc = 0;
    char command[COMMAND_SIZE];
    for( i = 0 ; i < COMMAND_SIZE; i++) {
    }

    int result = init();
    if( result ) {
        return result;
    }
    bwcls();

    for(;;) {
        result = io_poll();
        if( result ) {
            char c;
            if( !getc( &c ) ) {
                putc( c );
            }
        }

        result = clock_poll();
        if( result > 0 ) {
            clock_get( &mins, &secs, &tenths );

            savecur();
            setpos( 0, 0 );
            printf( "%d %d %d\n\r", mins, secs, tenths );
            loadcur();
        }
        if( result > 1 ) {
             //train_dance( secs );
        }
    }

	return 0;
}

