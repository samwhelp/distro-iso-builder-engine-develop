

################################################################################
### Head: Master / Mod / Chroot
##

mod_chroot_session () {


	util_error_echo "##"
	util_error_echo "## ## mod_chroot_session"
	util_error_echo "##"


}



##
### Tail: Master / Mod / Chroot
################################################################################


################################################################################
### Head: Master / Mod / Chroot / Mount
##

mod_distro_mount_for_chroot () {

	sys_distro_unmount_for_chroot

	sys_distro_mount_for_chroot

	return 0
}

mod_distro_unmount_for_chroot () {

	sys_distro_unmount_for_chroot

	return 0
}

##
### Tail: Master / Mod / Chroot / Mount
################################################################################
