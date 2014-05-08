
#include <bwio.h>
#include <iolib.h>
#include <ts7200.h>
#include <clock.h>

#include <train.h>

#define TRAIN 47

int main( int argc, char* argv[] ) {
    // char running = 1;
    // char str[] = "Hello World\n\r";
    
    bwprintf( COM2, "%c[2J", 0x1b );
    bwprintf( COM2, "%c[%d;%dH", 0x1b, 0, 0 );
    bwprintf( COM2, "Booting up NIK os\n\r" );
     
    int result = io_init();
    if( result ) return 1;
    bwprintf( COM2, "io setup success!!!!\n\r" );
   
    result = clock_init();
    if( result ) return 2;
    bwprintf( COM2, "clock setup success!!!!\n\r" );
         
    unsigned int tenths = 0;
    unsigned int secs = 0;
    unsigned int mins = 0;
    train_start();

    bwprintf( COM2, "%c[2J", 0x1b );
    bwprintf( COM2, "%c[%d;%dH", 0x1b, 0, 0 );
    for(;;) {
        result = io_poll();
        result = clock_poll();

        if( result > 0 ) {
            clock_get( &mins, &secs, &tenths );

            printf( "%c[%d;%dH", 0x1b, 0, 0 );
            printf( "%d %d %d\n\r", mins, secs, tenths );
        }
        if( result > 1 ) {
            switch ( secs ) {
            case 5:
                train_setspeed( TRAIN, 0 );
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
                train_setspeed( TRAIN, 0 );
                break;
            case 55:
                train_setspeed( TRAIN, 15 );
                break;
            default:
                break;
            }
        }
    }

	return 0;
}

