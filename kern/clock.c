
#include <clock.h>
#include <ts7200.h>

static unsigned int tens = 0;
static unsigned int secs = 0;
static unsigned int mins = 0;
unsigned int clock_ticks = 0;
static int last_tick = 0;

static int *T3_VAL;
static int *T4_VAL;

int clock_init() {
    tens = 0;
    secs = 0;
    mins = 0;
    last_tick = 0;
    clock_ticks = 0;

    T3_VAL  = (int*) TIMER3_BASE;
    *T3_VAL = 50800;
    T3_VAL  = (int*) TIMER3_CTRL;
    *T3_VAL = ENABLE_MASK | MODE_MASK | CLKSEL_MASK;
    T3_VAL  = (int*) TIMER3_VAL;


    return 0;
}

int clock_get( unsigned int *omins, unsigned int *osecs, unsigned int *otens ) {
    *otens = tens;
    *osecs = secs;
    *omins = mins;
    return 0;
}

void clock_t4enable() {
    T4_VAL  = (int*) TIMER4_HIGH;
    *T4_VAL = T4ENABLE_MASK;
    T4_VAL  = (int*) TIMER4_LOW;
}

unsigned int clock_t4tick() {
    return *T4_VAL;
}

int clock_poll() {
    int result = 0;
    int tick = *T3_VAL;

    if( tick > last_tick ) {
        clock_ticks++;
        
        if( tens == 9 ) {
            tens = 0;
            if( secs == 59 ) {
                secs = 0;
                mins++;
                result = 3;
            } else {
                secs++;
                result = 2;
            }
        } else {
            tens++;
            result = 1;
        }
    }

    last_tick = tick;
    return result;
}

