#include "string.h"

void strcpy (char* start,char* des, int num)
{
    for (int i = 0; i < num; i++)
    {
        start[i] = des[i];
    }
}