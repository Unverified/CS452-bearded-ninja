
#ifndef __IO_BUFFER_H__
#define __IO_BUFFER_H__

#define IOBUFFER_SIZE 512
#define IOBUFFER_FULL 43
#define IOBUFFER_EMPTY 42

struct IOBuffer {
    unsigned int head;
    unsigned int tail;
    unsigned int size;
    char buf[IOBUFFER_SIZE];
};

int iobuf_init( struct IOBuffer *buffer );
int iobuf_empty( struct IOBuffer *buffer );
int iobuf_get( struct IOBuffer *buffer, char *element );
int iobuf_store( struct IOBuffer *buffer, char element );

#endif

