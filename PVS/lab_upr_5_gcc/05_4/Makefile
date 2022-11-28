MODNAME = firstmod
CPU	= arm
CCPWD	= /home/lbogdanov/git_projects/STM32F769I-disco_Buildroot/buildroot/output/host/bin/arm-buildroot-uclinux-uclibcgnueabi-
KERNDIR = /home/lbogdanov/git_projects/STM32F769I-disco_Buildroot/buildroot/output/build/linux-custom

obj-m += ${MODNAME}.o

all:
	mkdir -p ./debug
	make ARCH=${CPU} LOCALVERSION=${LINVERSION} CROSS_COMPILE=${CCPWD} -C ${KERNDIR} SUBDIRS=$(PWD) modules
	mv ${MODNAME}.mod.c ${MODNAME}.ko ${MODNAME}.mod.o ${MODNAME}.o Module.symvers modules.order ./debug
clean:
	rm -r ./debug
