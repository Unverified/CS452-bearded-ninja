
#include <ts7200.h>
#include <niklib.h>

#include <bwio.h>
#include <iolib.h>

#include "iobuffer.h"

static struct IOBuffer oterm;
static struct IOBuffer otrain;

static int *TERM_FLAG;
static int *TERM_DATA;

static int *TRAIN_FLAG;
static int *TRAIN_DATA;

int io_init() {
    iobuf_init( &otrain );
    iobuf_init( &oterm );

    bwsetspeed( COM1, 2400 ); 

    if ( bwsetfifo( COM1, OFF ) || bwsetfifo( COM2, OFF ) ){
        return -1;
    }
		
    TERM_FLAG = (int *)( UART2_BASE + UART_FLAG_OFFSET );
    TERM_DATA = (int *)( UART2_BASE + UART_DATA_OFFSET );
            
    TRAIN_FLAG = (int *)( UART1_BASE + UART_FLAG_OFFSET );
    TRAIN_DATA = (int *)( UART1_BASE + UART_DATA_OFFSET );
    
    return 0;
}

int term_writepoll() {
    char c;

    if( iobuf_empty( &oterm )  ) return 1;
    if( (*TERM_FLAG & (TXFF_MASK | TXBUSY_MASK)) ) return 2;
    if( iobuf_get( &oterm, &c ) ) return 3;
    *TERM_DATA = c;

	return 0;
}

int train_writepoll() {
    char c;

    if( iobuf_empty( &otrain ) ) return 1;
    if( (*TRAIN_FLAG & (TXFF_MASK | TXBUSY_MASK)) || !(*TRAIN_FLAG & CTS_MASK) ) return 2;
    if( iobuf_get( &otrain, &c ) ) {
        return 3;
    }
    *TRAIN_DATA = c;
    
    return 0;
}

int io_poll() {
    int result = term_writepoll();
    result = result << 2;
    result |= train_writepoll();

    return result;
}

int putc( const char c ) {
    return iobuf_store( &oterm, c );
}

int puttrain( const char c ) {
    return iobuf_store( &otrain, c );
}

int putstr( char *str ) {
	while( *str ) {
		if( putc( *str ) < 0 ) return -1;
		str++;
	}
	return 0;
}

void putw( int n, char fc, char *bf ) {
	char ch;
	char *p = bf;

	while( *p++ && n > 0 ) n--;
	while( n-- > 0 ) putc( fc );
	while( ( ch = *bf++ ) ) putc( ch );
}

void formatString( char *fmt, va_list va ) {
	char bf[12];
	char ch, lz;
	int w;
	
	while ( ( ch = *(fmt++) ) ) {
		if ( ch != '%' )
            putc( ch );
		else {
			lz = 0; w = 0;
			ch = *(fmt++);
			switch ( ch ) {
			case '0':
                lz = 1;
                ch = *(fmt++);
                break;
			case '1':
			case '2':
			case '3':
			case '4':
			case '5':
			case '6':
			case '7':
			case '8':
			case '9':
				ch = bwa2i( ch, &fmt, 10, &w );
				break;
			}
			switch( ch ) {
			case 0: return;
			case 'c':
                putc( va_arg( va, char ) );
                break;
            case 's':
                putw( w, 0, va_arg( va, char* ) );
                break;
			case 'u':
				bwui2a( va_arg( va, unsigned int ), 10, bf );
				putw( w, lz, bf );
				break;
			case 'd':
				bwi2a( va_arg( va, int ), bf );
				putw( w, lz, bf );
				break;
			case 'x':
				bwui2a( va_arg( va, unsigned int ), 16, bf );
				putw( w, lz, bf );
				break;
			case '%':
				putc( ch );
				break;
			}
		}
	}
}

void printf( char *fmt, ... ) {
        va_list va;

        va_start(va,fmt);
        formatString( fmt, va );
        va_end(va);
}

int getc( char *output ) {
	if ( !( *TERM_FLAG & RXFF_MASK ) ) {
        return 1;
    }
	*output = *TERM_DATA;
	return 0;
}

int gettrain( char *output ) {
	if ( !( *TRAIN_FLAG & RXFF_MASK ) ) {
        return 1;
    }
	*output = *TRAIN_DATA;
	return 0;
}
