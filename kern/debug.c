
#include <clock.h>
#include <niklib.h>
#include <iolib.h>

unsigned int worst_loop = 0;
unsigned int current_loop = 0;
unsigned int previous_loop = 0;

unsigned int avg_pollrespond = 0;
unsigned int avg_pollrespondall = 0;

unsigned int profile1 = 0;
unsigned int poll_start = 0;

void debug_init() {
    worst_loop = 0;
    clock_t4enable();
    previous_loop = clock_t4tick();

    poll_start = 0;
    profile1 = 0;
    avg_pollrespond = 0;
    avg_pollrespondall = 0;
}

void debug_loop() {
    current_loop = clock_t4tick();
    int nTicks = current_loop - previous_loop;
    
    if( nTicks > worst_loop ) {
        worst_loop = nTicks;
    }
    
    previous_loop = current_loop;
}

void debug_pollsent() {
    profile1 = 1;
    poll_start = clock_t4tick();
}

void debug_responce() {
    if ( profile1 == 0 ) return;
    int nTicks = clock_t4tick() - poll_start;

    if( avg_pollrespond == 0 ) {
        avg_pollrespond = nTicks;
    } else {
        avg_pollrespond = (avg_pollrespond + nTicks) / 2;
    }

    profile1 = 0;
}

void debug_allresponces() {
    int nTicks = clock_t4tick() - poll_start;
    
    if( avg_pollrespond == 0 ) {
        avg_pollrespondall = nTicks;
    } else {
        avg_pollrespondall = (avg_pollrespondall + nTicks) / 2;
    }
}

void debug_print( ) {
    setpos( 6, 70 );
    printf( "%d", worst_loop );

    setpos( 8, 70 );
    printf( "%d", avg_pollrespond );

    setpos( 9, 70 );
    printf( "%d", avg_pollrespondall );
}


