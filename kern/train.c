
#include <bwio.h>
#include <iolib.h>
#include <ts7200.h>
#include <train.h>

static enum SWITCH_STATE gate_states[22];
static char train_state[80];


static int _storegate( int store ) {
    if( store < 0 ) return -1;
    if( store < 18 ) return store+1;
    if( store < 22 ) return store+(153-18);
    return -1;
}

static int _gatestore( int gate ) {
    if( gate < 1 ) return -1;
    if( gate <= 18 ) return gate-1;
    if( gate <= 156 && gate >= 153 ) return gate-(153-18);
    return -1;
}

static int _settrain( int train, int state ) {
    bwputc( COM1, (char)state );
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

    bwprintf( COM2, "setting gate %d to %c\n", gate, (char)state );

    bwputc( COM1, gate );
    bwputc( COM1, 32 );
    gate_states[_gatestore( gate )] = state;
    return 0;
}

int train_start() {
    int i;

    bwputc( COM1, 96 );

    bwprintf( COM2, "RESETTING TRACK...\n" );
    for( i = 0; i < 18; i++ ) {
        _setgate( _storegate( i ), CURVED );
    }
    _setgate( _storegate( i++ ), CURVED );
    _setgate( _storegate( i++ ), STRAIT );
    _setgate( _storegate( i++ ), CURVED );
    _setgate( _storegate( i++ ), STRAIT );

    bwprintf( COM2, "RESETTING TRAINS...\n" );
    for( i = 0; i < 80; i++ ) {
        _settrain( i+1, 1 );
    }
    return 0;
}

int train_setspeed( int train, int speed ) {
    if( train < 1 || train > 80 ) {
        printf( "Invalid Train Number: %d\n", train );
        return -1;
    }
    if( speed < 0 || speed > 14 ) {
        printf( "Invalid Speed For Train: %d\n", speed );
        return -1;
    }
    printf( "TRAIN %d SPEED %d\n", train, speed );
    return _settrain( train, speed );
}

int train_setgate( int gate, int state ) {
    enum SWITCH_STATE eState;
    switch( state ) {
    case 'S':
        eState = STRAIT;
        break;
    case 'C':
        eState = CURVED;
        break;
    default:
        printf( "Invalid Gate State %c", state );
        return -1;
    }

    return _setgate( gate, state );
}

