
#include <niklib.h>
#include <bwio.h>
#include <iolib.h>
#include <train.h>
#include <terminal.h>

#define TABLE_DOWN 2
#define TABLE_LEFT 5

void term_switchtable() {
    char tablehead[] = "=================     Gate States    ================";
    char table1[] =    "  1[ C ]   2[ C ]   3[ C ]   4[ C ]   5[ C ]   6[ C ]";
    char table2[] =    "  7[ C ]   8[ C ]   9[ C ]  10[ C ]  11[ C ]  12[ C ]";
    char table3[] =    " 13[ C ]  14[ C ]  15[ C ]  16[ C ]  17[ C ]  18[ C ]";
    char table4[] =    "153[ C ] 154[ S ] 155[ C ] 156[ S ]";

    char switch_head[] = "<<<<<<<<<<<<<<<<<  Recent Switches  <<<<<<<<<<<<<<<<<";


    bwsetpos( TABLE_DOWN, TABLE_LEFT );
    bwprintf( COM2, tablehead );
    bwsetpos( TABLE_DOWN+1, TABLE_LEFT );
    bwprintf( COM2, table1 );
    bwsetpos( TABLE_DOWN+2, TABLE_LEFT );
    bwprintf( COM2, table2 );
    bwsetpos( TABLE_DOWN+3, TABLE_LEFT );
    bwprintf( COM2, table3 );
    bwsetpos( TABLE_DOWN+4, TABLE_LEFT );
    bwprintf( COM2, table4 );

    bwsetpos( TABLE_DOWN+6, TABLE_LEFT );
    bwprintf( COM2, switch_head );
}

void term_uswitchtable( int gate, char state ) {
    if( gate >= 153 && gate <= 156 ) {
        gate -= (153-18);
    } else {
        gate --;
    }
    if( gate < 0 || gate > 21 ) {
        printf( "INVALID GATE!\n" );
        return;
    }

    int row = gate / 6;
    int col = gate % 6;

    savecur();
    setpos( TABLE_DOWN+1+row, TABLE_LEFT-4+(1+col)*9 );
    putc( state );
    loadcur();
}


int term_init() {
    int i;
    bwcls();

    bwprintf( COM2, "\x1B[10;40r" );
    for( i = 0; i < 100; i++ ){
        bwputc( COM2, '\n' );
    }

    bwsavecur();
    term_switchtable();
    bwloadcur();

    return 0;
}

void term_destroy() {
    bwprintf( COM2, "\x1B[r" );
    bwcls();
}

