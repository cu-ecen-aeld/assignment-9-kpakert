
##############################################################
#
# LDD
#
##############################################################

LDD_VERSION = 3544c69e8ecc011e3071bc8cfefabf0224654f7c
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE  = 'git@github.com:cu-ecen-aeld/assignment-7-kpakert'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = scull
LDD_MODULE_SUBDIRS += misc-modules

$(eval $(kernel-module))

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/sbin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/sbin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/sbin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/sbin/
endef


$(eval $(generic-package))
