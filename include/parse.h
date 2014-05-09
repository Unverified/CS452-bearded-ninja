
enum COMMAND {
    NONE,
    SPEED,
    GATE,
    REVERSE,
    QUIT,
    ERROR
};

enum COMMAND parse_command( char command[], int buffer[] );

