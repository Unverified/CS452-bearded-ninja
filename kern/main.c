
#include <bwio.h>
#include <iolib.h>
#include <ts7200.h>
#include <clock.h>

#include <train.h>

int main( int argc, char* argv[] ) {
    // char running = 1;
    // char str[] = "Hello World\n\r";
    int result = io_init();
    if( result ) return 1;
   
    result = clock_init();
    if( result ) return 2;
    
    bwprintf( COM2, "%c[2J", 0x1b );
         
    for(;;) {
        io_poll();
        if( clock_poll() ) {
            unsigned int tenths = 0;
            unsigned int secs = 0;
            unsigned int mins = 0;

            clock_get( &mins, &secs, &tenths );

            if( secs == 5 ) {
                train_setspeed( 50, 10 );
            } else if ( secs == 50 ) {
                train_setspeed( 50, 16 );
            }
            
            putc( 0x1b );
            printf( "[%d;%dH", 0, 0 );
            printf( "%d %d %d\n\r", mins, secs, tenths );
        }
    }
	return 0;
}

