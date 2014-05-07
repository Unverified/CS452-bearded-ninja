
void memcpy( char *destaddr, char *srcaddr, int len ) {
    while ( len-- ) *destaddr++ = *srcaddr++;
}

int abs( int val ) {
    return val < 0 ? -val : val;
}

