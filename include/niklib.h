
void memcpy( char *destaddr, char *srcaddr, int len );
int abs( int val );

int isspace( int c );
int isnum( char c );
int ishex( char c );

int bwa2d( char ch );
char bwa2i( char ch, char **src, int base, int *nump );
void bwui2a( unsigned int num, unsigned int base, char *bf );
void bwi2a( int num, char *bf );

