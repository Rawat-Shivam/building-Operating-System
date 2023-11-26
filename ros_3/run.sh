#assemble boot.s file  
as boot.S -o boot.o  
  
#compile kernel.c file  
gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra  
  
#linking the kernel with kernel.o and boot.o files  
gcc -T linker.ld -o ROS.bin -ffreestanding -O2 -nostdlib kernel.o boot.o -lgcc  
  
#check MyOS.bin file is x86 multiboot file or not  
#grub-file --is-x86-multiboot ROS.bin  
grub2-file --is-x86-multiboot ROS.bin  
  
#building the iso file , as grub require it to load the menuentry
# to load the ROS.bin file
mkdir -p isodir/boot/grub  
cp ROS.bin isodir/boot/ROS.bin  
cp grub.cfg isodir/boot/grub/grub.cfg  
grub2-mkrescue -o ROS.iso isodir  

#run it in qemu  
qemu-system-x86_64 -cdrom ROS.iso  
