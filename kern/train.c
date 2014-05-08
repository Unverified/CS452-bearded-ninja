
#include <bwio.h>
#include <iolib.h>
#include <ts7200.h>
#include <train.h>

#define NOP_WAIT 500

int _nop() {
    int i;
    for( i = 1; i < NOP_WAIT; i ++ );
    return 0;
}

static enum SWITCH_STATE gate_states[80];
static char train_state[80];

static int _settrain( int train, int state ) {
    bwputc( COM1, (char)state );
    _nop();
    bwputc( COM1, (char)train );

    train_state[train-1] = (char) state;
    return 0;
}

static int _setgate( int gate, enum SWITCH_STATE state ) {
    switch( state ) {
    case CURVED:
        bwputc( COM1, 34 );
        break;
    case STRAIT:
        bwputc( COM1, 33 );
        break;
    }
    _nop();

    bwputc( COM1, gate );

    _nop();
    _nop();
    _nop();

    bwputc( COM1, 32 );
    gate_states[gate-1] = state;

    return 0;
}


int train_start() {
    int i;

    bwputc( COM1, 96 );
    _nop();
    bwprintf( COM2, "\rRESETTING TRACK...\n\r" );
    for( i = 0; i < 80; i++ ) {
        _setgate( i+1, CURVED );
        _nop();
    }
    
    bwprintf( COM2, "RESETTING TRAINS...\n\r" );
    for( i = 0; i < 80; i++ ) {
        _settrain( i+1, 1 );
        _nop();
    }
    
    return 0;
}

int train_setspeed( int train, int speed ) {
    printf( "\n\rTRAIN %d SPEED %d", train, speed );
    return _settrain( train, speed );
}

int train_setgate( int gate, enum SWITCH_STATE state ) {
    return _setgate( gate, state );
}


