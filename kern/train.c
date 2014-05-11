
#include <bwio.h>
#include <iolib.h>
#include <ts7200.h>
#include <terminal.h>

#include <train.h>

#define NUM_TRAINS 7

extern unsigned int clock_ticks;

static enum SWITCH_STATE gate_states[22];
static struct Train_State train_state[NUM_TRAINS];

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

static int _trainstore( int train ) {
    switch ( train ) {
    case 43:
        return 0;
    case 45:
        return 1;
    case 47:
        return 2;
    case 48:
        return 3;
    case 49:
        return 4;
    case 50:
        return 5;
    case 51:
        return 6;
    default:
        return -1;
    }
}

static int _storetrain( int store ) {
    switch( store ) {
    case 0:
        return 43;
    case 1:
        return 45;
    case 2:
        return 47;
    case 3:
        return 48;
    case 4:
        return 49;
    case 5:
        return 50;
    case 6:
        return 51;
    default:
        return -1;
    }
}

static int _bwsettrain( int train, int state ) {
    bwputc( COM1, (char)state );
    bwputc( COM1, (char)train );

    int store = _trainstore( train );
    bwprintf( COM2, "Setting Train %d State: %d\n", train, state );
    train_state[store].reversing = 0;
    train_state[store].cstate = (char) state;
    return 0;
}

static int _bwsetgate( int gate, enum SWITCH_STATE state ) {
    switch( state ) {
    case CURVED:
        bwputc( COM1, 34 );
        break;
    case STRAIT:
        bwputc( COM1, 33 );
        break;
    }
    bwputc( COM1, gate );
    bwputc( COM1, 32 );
    bwprintf( COM2, "Setting Gate %d: %c\n", gate, state );
    gate_states[_gatestore( gate )] = state;
    return 0;
}

static int _settrain( int train, int state ) {
    puttrain( (char)state );
    puttrain( (char)train );
    return 0;
}

static int _setgate( int gate, enum SWITCH_STATE state ) {
    switch( state ) {
    case CURVED:
        puttrain( 34 );
        break;
    case STRAIT:
        puttrain( 33 );
        break;
    }

    puttrain( gate );
    puttrain( 32 );

    term_uswitchtable( gate, state );
    gate_states[_gatestore( gate )] = state;
    return 0;
}

int train_init() {
    int i;

    bwputc( COM1, 96 );
    bwprintf( COM2, "RESETTING TRACK...\n" );
    for( i = 0; i < 18; i++ ) {
        _bwsetgate( _storegate( i ), CURVED );
    }
    _bwsetgate( _storegate( i++ ), CURVED );
    _bwsetgate( _storegate( i++ ), STRAIT );
    _bwsetgate( _storegate( i++ ), CURVED );
    _bwsetgate( _storegate( i++ ), STRAIT );

    bwprintf( COM2, "RESETTING TRAINS...\n" );
    for( i = 0; i < NUM_TRAINS; i++ ) {
        _bwsettrain( _storetrain( i ), 0 );
    }

    bwprintf( COM2, "Clearing Switch Data... \n" );
    bwputc( COM1, 192 );

    return 0;
}

int train_setspeed( int train, int speed ) {
    int store = _trainstore( train );
    if( store == -1 ) {
        printf( "Invalid Train Number: %d\n", train );
        return -1;
    }
    if( speed < 0 || speed > 14 ) {
        printf( "Invalid Speed For Train: %d\n", speed );
        return -1;
    }

    struct Train_State *state = &train_state[store];
    state->cstate = ((~TSPEED_MASK) & state->cstate) | speed;
    printf( "Setting Train %d Speed: %d\n", train, speed );
    if( state->reversing ) {
        return 1;
    }

    return _settrain( train, speed );
}

int train_setgate( int gate, int state ) {
    enum SWITCH_STATE eState;
    switch( state ) {
    case 'S':
    case 's':
        eState = STRAIT;
        break;
    case 'C':
    case 'c':
        eState = CURVED;
        break;
    default:
        printf( "Invalid Gate State %c", state );
        return -1;
    }

    printf( "Setting Gate %d: %c\n", gate, (char)state );
    return _setgate( gate, state );
}

int train_reverse( int train ) {
    int store = _trainstore( train );
    if( store == -1 ) {
        printf( "Invalid Train Number: %d\n", train );
    }

    struct Train_State *state = &train_state[store];
    if( state->reversing ) {
        state->reversing = 0;
        return _settrain( train, state->cstate );
    }
    
    state->reversing = 1;
    state->waittill = clock_ticks + 40;

    puttrain( 0 );
    puttrain( train );

    return 0;
}

int train_poll() {
    int i;

    for( i = 0; i < NUM_TRAINS; i++ ) {
        int train = _storetrain( i );
        if( train_state[i].reversing == 1 && train_state[i].waittill < clock_ticks ) {
            _settrain( train, 15 );
            _settrain( train, train_state[i].cstate );
            train_state[i].reversing = 0;
        }
    }
    return 0;
}


int train_askdump() {
    return puttrain( 133 );
}


