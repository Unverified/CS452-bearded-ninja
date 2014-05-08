
#include <bwio.h>
#include <iolib.h>
#include <ts7200.h>
#include <clock.h>

int main( int argc, char* argv[] ) {
    // char running = 1;
    // char str[] = "Hello World\n\r";
    int result = io_init();
    if( result ) return 1;
   
    result = clock_init();
    if( result ) return 2;
    
     
    while( 1 ) {
        io_poll();
        if( clock_poll() ) {
            unsigned int tenths = 0;
            unsigned int secs = 0;
            unsigned int mins = 0;

            clock_get( &mins, &secs, &tenths );
            printf( "%d %d %d\n\r", mins, secs, tenths );
        }
    }

/*    
    bwsetfifo( COM2, OFF );
	bwputstr( COM2, str );
	bwputw( COM2, 10, '*', str );
	bwprintf( COM2, "Hello world.\n\r" );
	bwprintf( COM2, "%s world%u.\n\r", "Well, hello", 23 );
	bwprintf( COM2, "%d worlds for %u person.\n\r", -23, 1 );
	bwprintf( COM2, "%x worlds for %d people.\n\r", -23, 723 );
	str[0] = bwgetc( COM2 );
	bwprintf( COM2, "%s", str );
*/

	return 0;
}

