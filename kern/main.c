
#include <bwio.h>
#include <iolib.h>
#include <ts7200.h>

int main( int argc, char* argv[] ) {
    // char running = 1;
    // char str[] = "Hello World\n\r";
    int result = io_init();
    if( result ) return result;
    
    unsigned char tenths = 0;
    unsigned char secs = 0;
    unsigned int mins = 0;

    putc( 'f' );
    putc( 'f' );
    putc( 'f' );
    putc( 'f' );
    putc( 'g' );
   
    int *ptr = TIMER3_BASE;
    *ptr = 200;

    ptr = TIMER3_CTRL;
    *ptr = (ENABLE_MASK | MODE_MASK);

    int ltick = 0;

    ptr = TIMER3_VAL;
    while( 1 ) {
        int tick = *ptr;

        if ( tick > ltick ) {
            tenths += 1;
            if( tenths == 10 ) {
                secs += 1;
                tenths = 0;
                if( secs == 60 ) {
                    mins += 1;
                    secs = 0;
                }
            }
            bwprintf( COM2, "%d %d\n\r", tick, ltick );
            bwprintf( COM2, "%d %d %d\n\r", mins, secs, tenths );
        }

        io_poll();
        ltick = tick;
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

