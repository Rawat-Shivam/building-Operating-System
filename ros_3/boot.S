

#first set magic number of multiboot
.set MAGIC, 0x1BADB002

#set flags
.set FLAGS, 0

#set checksum
.set CHECKSUM,-(MAGIC + FLAGS)

#we dont need other feilds as mentioned below
#header_addr
#load_addr
#load_end_addr
#bss_end_addr
#entry_addr
#mode_type
#width
#height
#depth

#set multiboot section
.section .multiboot

#set types for MAGIC,FLAGS
.long MAGIC
.long FLAGS
.long CHECKSUM

#now we need stack for our kernel functions
#stack grows from higher memory addresses to lower memory addresses
#first define the stack bottom
stackBottom:

#say we need 512 stack size
#skip those
.skip 512

#set stack top now
stackTop:

#set sections
.section .text
.global _start
.type _start, @function

#so lets start with a starting point
_start: 
	#get the current stack pointer from esp
	mov $stackTop, %esp
	#call the main kernel
	call KERNEL_MAIN
	#clear the interrupts
	cli
#put system in infinite loop
hltLoop:
	hlt
	jmp hltLoop

.size _start, . - _start





