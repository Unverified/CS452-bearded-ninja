
#include <ts7200.h>
#include <niklib.h>

#include <bwio.h>
#include <iolib.h>

#include "iobuffer.h"

static struct IOBuffer oterm;
static struct IOBuffer iterm;

int io_init() {
    iobuf_init( &iterm );
    iobuf_init( &oterm );

    bwsetspeed( COM1, 2400 ); 


    if ( bwsetfifo( COM1, OFF ) || bwsetfifo( COM2, OFF ) ){
        return -1;
    }
    return 0;
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

int putc( const char c ) {
    return iobuf_store( &oterm, c );
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

