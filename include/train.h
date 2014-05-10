
enum SWITCH_STATE {
    CURVED = 'C',
    STRAIT = 'S'
};

int train_init( void );

int train_setspeed( int train, int speed );
int train_setgate( int gate, int state );
int train_askdump( void );

