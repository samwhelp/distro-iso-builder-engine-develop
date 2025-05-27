

################################################################################
### Head: Master / Sys / Chroot
##

sys_chroot_run () {

	local img_dir_path="${REF_DISTRO_IMG_DIR_PATH}"

	sudo env DEBIAN_FRONTEND=noninteractive chroot "${img_dir_path}" ${@}

}

##
### Tail: Master / Sys / Chroot
################################################################################
