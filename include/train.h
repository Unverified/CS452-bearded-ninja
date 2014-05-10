
enum SWITCH_STATE {
    CURVED = 'C',
    STRAIT = 'S'
};

int train_start( void );

int train_setspeed( int train, int speed );
int train_setgate( int gate, int state );
int train_askdump( void );

