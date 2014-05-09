
#include <niklib.h>
#include <parse.h>
#include <iolib.h>

int consume_integer( char str[], int *index ) {
    int result = 0;
    for( ; isnum( str[*index] ); *index += 1 ) {
        result = (result * 10) + ( str[*index] - '0' );
    }
    return result;
}

int consume_whitespace( char str[], int *index ) {
    if( !isspace( str[*index] ) ) return -1;
    for( ; isspace( str[*index] ) ; *index += 1 );
    if( str[*index] == '\0' ) return 1;
    return 0;
}

int parse_argument( char command[], char type, int *index, int *arg ) {
    if( consume_whitespace( command, index ) ) {
        printf( "died at position %d(%d)\n", *index, command[*index] );
        return -1;
    }

    switch( type ) {
    case 'i':
        *arg = consume_integer( command, index );
        break;
    case 'c':
        if( command[*index] == '\0' ) {
            printf( "died at position %d(%d)\n", *index, command[*index] );
            return -1;
        }
        *arg = command[*index];
        *index += 1;
        break;
    }
    return 0;
}

int parse_gate( char command[], int buffer[] ) {
    int index = 1;
    if( command[index++] != 'w' ) return -1;
    if( parse_argument( command, 'i', &index, buffer ) ) return -1;
    if( parse_argument( command, 'c', &index, &buffer[1] ) ) return -1;
    if( !isspace( command[index] ) ) return -1;

    return 0;
}

int parse_train( char command[], int buffer[] ) {
    int index = 1;
    if( command[index++] != 'r' ) return -1;
    if( parse_argument( command, 'i', &index, buffer ) ) return -1;
    if( parse_argument( command, 'i', &index, &buffer[1] ) ) return -1;
    if( !isspace( command[index] ) ) return -1;

    return 0;
}

int parse_stop( char command[] ) {
    return !isspace( command[1] );
}

int parse_reverse( char command[], int buffer[] ) {
    int index = 1;
    if( command[index++] != 'v' ) return -1;
    if( parse_argument( command, 'i', &index, buffer ) ) return -1;
    return 0;
}

enum COMMAND parse_command( char command[], int buffer[] ) {
    switch( command[0] ) {
    case '\r':
        return NONE;
    case 'q':
        if( parse_stop( command ) ) { return ERROR; }
        return QUIT;
    case 't':
        if( parse_train( command, buffer ) ) { return ERROR; }
        return SPEED;
    case 'r':
        if( parse_reverse( command, buffer ) ) { return ERROR; }
        return REVERSE;
    case 's':
        if( parse_gate( command, buffer ) ) { return ERROR; }
        return GATE;
    default:
        return ERROR;
    }
}

