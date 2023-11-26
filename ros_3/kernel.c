
#include"kernel.h"

//now we need a fucntion that will return a value of each 16 bit pixel of the character that we want to display on a screen with colour
//to do that we must retuen an 16 but value
//because our TERMINAL_BUFER is of 16 bit 

static UINT16 VGA_DefaultEntry(unsigned char ch_to_print)
{
	//left shift will convert the white color value to some drawable character value in pixel format encoding with that character that we want to print
	//thats why we took bitwise OR of it , not AND
	return(UINT16)ch_to_print|(UINT16)WHITE_COLOR <<8;
}

//now main fucntion which has sbeen called in the boot.S file
void KERNEL_MAIN()
{
	//first lets initialze a TERMINAL_BUFFER pointer, points to a VGA address
	//but we need to cast it first
	TERMINAL_BUFFER = (UINT16*) VGA_ADDRESS;  

	//now we will access the VGA just like array index
	//here we nwws a vlaue that we need to print in pixel format
	//so we will call the VGA_DefaultEntry fucntionand use returned value
	TERMINAL_BUFFER[0] = VGA_DefaultEntry('R');  
	TERMINAL_BUFFER[1] = VGA_DefaultEntry('a');  
	TERMINAL_BUFFER[2] = VGA_DefaultEntry('w');  
	TERMINAL_BUFFER[3] = VGA_DefaultEntry('a');  
	TERMINAL_BUFFER[4] = VGA_DefaultEntry('t');  
	TERMINAL_BUFFER[5] = VGA_DefaultEntry(' ');  
	TERMINAL_BUFFER[6] = VGA_DefaultEntry('O');  
	TERMINAL_BUFFER[7] = VGA_DefaultEntry('S');  

}


