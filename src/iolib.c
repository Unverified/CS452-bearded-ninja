
#include <ts7200.h>
#include <bwio.h>
#include <iolib.h>

#include "iobuffer.h"

static struct IOBuffer oterm;
static struct IOBuffer iterm;

int io_init() {
    iobuf_init( &iterm );
    iobuf_init( &oterm );

    if ( bwsetfifo( COM1, OFF ) || bwsetfifo( COM2, OFF ) ){
        return -1;
    }
    return 0;
}

int putc( const char c ) {
    bwprintf( COM2, "storing %c inbuf at %d\n\r", c, &oterm );
    return iobuf_store( &oterm, c );
}

int io_poll() {
    char c;
    int *flags = (int *)( UART2_BASE + UART_FLAG_OFFSET );
	int *data = (int *)( UART2_BASE + UART_DATA_OFFSET );

    if( iobuf_empty( &oterm )  ) return 2;
    if( ( *flags & TXFF_MASK ) ) return 1;

    if( iobuf_get( &oterm, &c ) ) {
        return -1;
    }
    *data = c;

	return 0;
}

