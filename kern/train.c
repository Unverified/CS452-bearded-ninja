
#include <bwio.h>
#include <iolib.h>
#include <ts7200.h>
#include <train.h>

int train_setspeed( char train, char speed ) {
    bwputc( COM1, speed );
    bwputc( COM1, train );

    return 0;
}

