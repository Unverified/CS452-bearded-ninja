
#ifndef __TRAIN_H__
#define __TRAIN_H__

enum SWITCH_STATE {
    CURVED = 'C',
    STRAIT = 'S'
};

struct SwitchName {
    char bank;
    unsigned int num;
};

#define TSPEED_MASK 0x0F

struct Train_State {
    int cstate;
    int reversing;
    unsigned int waittill;
};


int train_init( void );
int train_poll( void );

int train_setspeed( int train, int speed );
int train_setgate( int gate, int state );
int train_reverse( int train );
int train_askdump( void );

#endif

