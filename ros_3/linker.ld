 /* entry point of our kernel or bootloader main function */  
ENTRY(_start)  
  
SECTIONS  
{  
    /* we need 1MB of space atleast */  
    . = 1M;  
  
    /* size of each section at least 4K */
    /* text section */  
    .text BLOCK(4K) : ALIGN(4K)  
    {  
        *(.multiboot)  
        *(.text)  
    }  
  
    /* read only data section */  
    .rodata BLOCK(4K) : ALIGN(4K)  
    {  
        *(.rodata)  
    }  
  
    /* data section */  
    .data BLOCK(4K) : ALIGN(4K)  
    {  
        *(.data)  
    }  
  
    /* bss section */  
    .bss BLOCK(4K) : ALIGN(4K)  
    {  
        *(COMMON)  
        *(.bss)  
    }  
  
}  










