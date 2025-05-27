

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


################################################################################
### Head: Master / Sys / Chroot / Mount
##

sys_distro_mount_for_chroot () {


	return 0
}

sys_distro_unmount_for_chroot () {


	return 0
}

##
### Tail: Master / Sys / Chroot / Mount
################################################################################
