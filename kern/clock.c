
#include <clock.h>
#include <ts7200.h>

static unsigned int tens = 0;
static unsigned int secs = 0;
static unsigned int mins = 0;
static int last_tick = 0;
static int *T3_VAL;

int clock_init() {
    tens = 0;
    secs = 0;
    mins = 0;
    last_tick = 0;

    T3_VAL  = (int*) TIMER3_BASE;
    *T3_VAL = 200;

    T3_VAL  = (int*) TIMER3_CTRL;
    *T3_VAL = ENABLE_MASK | MODE_MASK;

    T3_VAL = (int*) TIMER3_VAL;

    return 0;
}

int clock_get( unsigned int *omins, unsigned int *osecs, unsigned int *otens ) {
    *otens = tens;
    *osecs = secs;
    *omins = mins;
    return 0;
}

int clock_poll() {
    int result = 0;
    int tick = *T3_VAL;

    if( tick > last_tick ) {
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

