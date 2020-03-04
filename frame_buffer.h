void fb_write_cell(unsigned int i, char c, unsigned char fg, unsigned char bg);
void fb_move_cursor(unsigned short pos); 
void fb_write_string(int offset, char* s, int length);
void fb_clear();