#include "io.h"
#include "mem_man.h"
#include "frame_buffer.h"
#include "string.h"

int main() 
{
    fb_clear();
    char* a = get_mem(11);
    strcpy(a,"hello world",11);
    fb_write_string(0, a ,11);
    clearAllMemory();
    return 0;
}