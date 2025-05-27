

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

	##
	## https://github.com/mvallim/live-custom-ubuntu-from-scratch/blob/master/scripts/build.sh#L46-L52
	##

	sudo mount --bind /dev "${REF_DISTRO_IMG_DIR_PATH}"/dev
	sudo mount --bind /run "${REF_DISTRO_IMG_DIR_PATH}"/run

	sudo chroot "${REF_DISTRO_IMG_DIR_PATH}" mount none -t proc /proc
	sudo chroot "${REF_DISTRO_IMG_DIR_PATH}" mount none -t sysfs /sys
	sudo chroot "${REF_DISTRO_IMG_DIR_PATH}" mount none -t devpts /dev/pts

	return 0
}

sys_distro_unmount_for_chroot () {

	##
	## https://github.com/mvallim/live-custom-ubuntu-from-scratch/blob/master/scripts/build.sh#L54-L60
	##

	sudo chroot "${REF_DISTRO_IMG_DIR_PATH}" umount /proc
	sudo chroot "${REF_DISTRO_IMG_DIR_PATH}" umount /sys
	sudo chroot "${REF_DISTRO_IMG_DIR_PATH}" umount /dev/pts

	sudo umount "${REF_DISTRO_IMG_DIR_PATH}"/dev
	sudo umount "${REF_DISTRO_IMG_DIR_PATH}"/run

	return 0
}

##
### Tail: Master / Sys / Chroot / Mount
################################################################################
