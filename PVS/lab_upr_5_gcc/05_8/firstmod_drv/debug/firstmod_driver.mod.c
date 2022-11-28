#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);
MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

#ifdef RETPOLINE
MODULE_INFO(retpoline, "Y");
#endif

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
	{ 0xd19d4e31, __VMLINUX_SYMBOL_STR(module_layout) },
	{ 0xb07055a9, __VMLINUX_SYMBOL_STR(platform_driver_unregister) },
	{ 0x4acbf622, __VMLINUX_SYMBOL_STR(cdev_del) },
	{ 0x16e4588f, __VMLINUX_SYMBOL_STR(device_destroy) },
	{ 0xbeb67d37, __VMLINUX_SYMBOL_STR(cdev_add) },
	{ 0x725990f3, __VMLINUX_SYMBOL_STR(cdev_init) },
	{ 0xc25df7ba, __VMLINUX_SYMBOL_STR(class_destroy) },
	{ 0xb4f43aa4, __VMLINUX_SYMBOL_STR(device_create) },
	{ 0x7485e15e, __VMLINUX_SYMBOL_STR(unregister_chrdev_region) },
	{ 0xd979f65a, __VMLINUX_SYMBOL_STR(__class_create) },
	{ 0x29537c9e, __VMLINUX_SYMBOL_STR(alloc_chrdev_region) },
	{ 0x794145cc, __VMLINUX_SYMBOL_STR(__platform_driver_register) },
	{ 0x85f74b00, __VMLINUX_SYMBOL_STR(iomem_resource) },
	{ 0xc73551ab, __VMLINUX_SYMBOL_STR(of_iomap) },
	{ 0x9416e1d8, __VMLINUX_SYMBOL_STR(__request_region) },
	{ 0x83cf4288, __VMLINUX_SYMBOL_STR(of_address_to_resource) },
	{ 0x71a5699d, __VMLINUX_SYMBOL_STR(of_match_device) },
	{ 0xedc03953, __VMLINUX_SYMBOL_STR(iounmap) },
	{ 0xe0875eb1, __VMLINUX_SYMBOL_STR(kstrtobool) },
	{ 0xefd6cf06, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr0) },
	{ 0x2e5810c6, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr1) },
	{ 0x27e1a049, __VMLINUX_SYMBOL_STR(printk) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";

MODULE_ALIAS("of:N*T*Cfirstmod");
MODULE_ALIAS("of:N*T*CfirstmodC*");

MODULE_INFO(srcversion, "9EF10EECE68B79255EF8C8A");
