
#include <niklib.h>

void memcpy( char *destaddr, char *srcaddr, int len ) {
    while ( len-- ) *destaddr++ = *srcaddr++;
}

int abs( int val ) {
    return val < 0 ? -val : val;
}

int isspace( int c ) {
    switch( c ) {
    case ' ':
    case '\t':
    case '\n':
    case '\v':
    case '\f':
    case '\r':
        return 1;
    default:
        return 0;
    }
}

int isnum( char c ) {
    return c >= '0' && c <= '9';
}

int ishex( char c ) {
    return isnum( c ) || ( c >= 'a' && c <= 'f' ) || ( c >= 'A' && c <= 'F' );
}

int bwa2d( char ch ) {
	if( isnum( ch ) ) return ch - '0';
	if( ch >= 'a' && ch <= 'f' ) return ch - 'a' + 10;
	if( ch >= 'A' && ch <= 'F' ) return ch - 'A' + 10;
	return -1;
}

char bwa2i( char ch, char **src, int base, int *nump ) {
	int num, digit;
	char *p;

	p = *src; num = 0;
	while( ( digit = bwa2d( ch ) ) >= 0 ) {
		if ( digit > base ) break;
		num = num*base + digit;
		ch = *p++;
	}
	*src = p; *nump = num;
	return ch;
}

void bwui2a( unsigned int num, unsigned int base, char *bf ) {
	int n = 0;
	int dgt;
	unsigned int d = 1;
	
	while( (num / d) >= base ) d *= base;
	while( d != 0 ) {
		dgt = num / d;
		num %= d;
		d /= base;
		if( n || dgt > 0 || d == 0 ) {
			*bf++ = dgt + ( dgt < 10 ? '0' : 'a' - 10 );
			++n;
		}
	}
	*bf = 0;
}

void bwi2a( int num, char *bf ) {
	if( num < 0 ) {
		num = -num;
		*bf++ = '-';
	}
	bwui2a( num, 10, bf );
}


