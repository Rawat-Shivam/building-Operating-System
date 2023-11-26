GPPPARAMS = -m32 -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore
ASPARAMS = --32
LDPARAMS = -melf_i386

objects = loader.o kernel.o

%.o: %.cpp
	g++  $(GPPPARAMS) -o $@ -c $<
	
%.o: %.s
	as $(ASPARAMS) -o $@ $<

myKernel.bin: linker.ld $(objects)    
	ld $(LDPARAMS) -T $< -o $@ $(objects)

install: myKernel.bin
	sudo cp $< /boot/myKernel.bin
myKernel.iso: myKernel.bin

	mkdir iso
	mkdir iso/boot
	mkdir iso/boot/grub 
	cp $< iso/boot
	echo 'set timeout=0' >>iso/boot/grub/grub.cfg
	echo 'det default=0' >>iso/boot/grub/grub.cfg
	echo '' >>iso/boot/grub/grub.cfg
	echo 'menuentry "RawatOperatingSystem: R-OS" {' >>iso/boot/grub/grub.cfg
	echo '	multiboot /boot/myKernel.bin' >>iso/boot/grub/grub.cfg
	echo '	boot' >>iso/boot/grub/grub.cfg
	echo '}' >>iso/boot/grub/grub.cfg
	grub2-mkrescue --output=$@ iso
	rm -rf iso
run: myKernel.iso
	(killall VirtualBox && sleep 2) || true
	VirtualBox --startvm "RawatOperatingSystem: R-OS" &
