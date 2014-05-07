
#include <ts7200.h>
#include "iobuffer.h"

static void inc_bufcount( unsigned int *value ){
    unsigned int val = *value;
    val += 1;
    if( val >= IOBUFFER_SIZE ) {
        val = 0;
    }
    *value = val;
}

int iobuf_init( struct IOBuffer *buffer ) {
    buffer->size = 0;
    buffer->head = 0;
    buffer->tail = 0;
    return 0;
}

int iobuf_get( struct IOBuffer *buffer, char *element ) {
  if( buffer->size == 0 ) return IOBUFFER_EMPTY;

    *element = buffer->buf[buffer->head];
    inc_bufcount( &(buffer->head) );
    buffer->size -= 1;

    return 0;
}

int iobuf_store( struct IOBuffer *buffer, char element ) {
  if( buffer->size == IOBUFFER_SIZE ) return IOBUFFER_FULL;
    
    buffer->buf[buffer->tail] = element;
    inc_bufcount( &(buffer->tail) );
    buffer->size += 1;

    return 0;
}

