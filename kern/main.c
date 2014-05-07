
#include <bwio.h>
#include <iolib.h>
#include <ts7200.h>

int main( int argc, char* argv[] ) {
    // char running = 1;
    // char str[] = "Hello World\n\r";

    int result = io_init();
    if( result ) return result;

    putc( 'f' );
    putc( 'f' );
    putc( 'f' );
    putc( 'f' );


    while( 1 ) {
        if( io_poll() == 2 ) break;
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

