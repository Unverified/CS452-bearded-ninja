
#include <ts7200.h>
#include "iobuffer.h"

static void inc_bufcount( struct IOBuffer *buffer , unsigned int *value ){
    unsigned int val = *value;
    if( val == buffer->max_size - 1 ) {
        *value = (*value + 1);
    } else {
        *value = 0;
    }
}

int buffer_init( struct IOBuffer *buffer, char space[], unsigned int max_size ) {
    buffer->buf  = space;
    buffer->size = 0;
    buffer->head = 0;
    buffer->tail = 0;
    buffer->max_size = max_size;
  return 0;
}

int buffer_empty( struct IOBuffer *buffer ) {
    return buffer->size == 0;
}

int buffer_get( struct IOBuffer *buffer, char *element ) {
  if( buffer->size == 0 ) return IOBUFFER_EMPTY;

    *element = buffer->buf[buffer->head];
    inc_bufcount( buffer, &(buffer->head) );
    buffer->size -= 1;

  return 0;
}

int buffer_store( struct IOBuffer *buffer, char element ) {
  if( buffer->size == buffer->max_size ) return IOBUFFER_FULL;

    buffer->buf[buffer->tail] = element;
    inc_bufcount( buffer, &(buffer->tail) );
    buffer->size += 1;

    return 0;
}

