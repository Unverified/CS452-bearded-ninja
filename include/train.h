
enum SWITCH_STATE {
    CURVED = 'C',
    STRAIT = 'S'
};

int train_start();
int train_setspeed( int train, int speed );
int train_setgate( int gate, enum SWITCH_STATE state );

