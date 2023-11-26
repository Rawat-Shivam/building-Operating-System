
#ifndef KERNEL_H
#define KERNEL_H

//lets define VGA address
//#define VGA_ADDRESS  0xB8000 
#define VGA_ADDRESS  0x000B8000 
  
//we also need a default colour to display characters
#define WHITE_COLOR 15  
  
typedef unsigned short UINT16;  

//we need a buffer that points to VGA
UINT16* TERMINAL_BUFFER;


#endif





