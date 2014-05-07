
#include <ts7200.h>
#include <bwio.h>
#include <iolib.h>

#include "iobuffer.h"

static struct IOBuffer buf;

int io_init() {
    iobuf_init( &buf );

    if ( bwsetfifo( COM1, OFF ) || bwsetfifo( COM2, OFF ) ){
        return -1;
    }
    return 0;
}

int putc( const char c ) {
    bwprintf( COM2, "storing %c inbuf at %d\n\r", c, &buf );
    return iobuf_store( &buf, c );
}

int io_poll() {
    char c;

    if( iobuf_get( &buf, &c ) ){
        bwprintf( COM2, "failed to get thing from buffer" );
        return -1;
    }

    bwputc( COM2, c );

/*
    if( !iobuf_empty( &buf )  ) return 2;
    if( !( *flags & TXFF_MASK ) ) return 1;

    char c;
    if( iobuf_get( &buf, &c ) ) {
        return -1;
    }
    *data = c;
*/

	return 0;
}

