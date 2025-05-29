

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


	if ! [ -d "${REF_DISTRO_IMG_DIR_PATH}" ]; then
		return 0
	fi


	##
	## https://github.com/mvallim/live-custom-ubuntu-from-scratch/blob/master/scripts/build.sh#L46-L52
	##

	sudo mount --bind /dev "${REF_DISTRO_IMG_DIR_PATH}"/dev || true
	sudo mount --bind /run "${REF_DISTRO_IMG_DIR_PATH}"/run || true

	sudo chroot "${REF_DISTRO_IMG_DIR_PATH}" mount none -t proc /proc || true
	sudo chroot "${REF_DISTRO_IMG_DIR_PATH}" mount none -t sysfs /sys || true
	sudo chroot "${REF_DISTRO_IMG_DIR_PATH}" mount none -t devpts /dev/pts || true

	return 0
}

sys_distro_unmount_for_chroot () {


	if ! [ -d "${REF_DISTRO_IMG_DIR_PATH}" ]; then
		return 0
	fi


	##
	## https://github.com/mvallim/live-custom-ubuntu-from-scratch/blob/master/scripts/build.sh#L54-L60
	##

	sudo chroot "${REF_DISTRO_IMG_DIR_PATH}" umount /proc || true
	sudo chroot "${REF_DISTRO_IMG_DIR_PATH}" umount /sys || true
	sudo chroot "${REF_DISTRO_IMG_DIR_PATH}" umount /dev/pts || true

	sudo umount "${REF_DISTRO_IMG_DIR_PATH}"/dev || true
	sudo umount "${REF_DISTRO_IMG_DIR_PATH}"/run || true

	return 0
}

##
### Tail: Master / Sys / Chroot / Mount
################################################################################


################################################################################
### Head: Master / Sys / Chroot / Session
##

sys_chroot_session_prepare_dir () {

	sudo rm -rf "${REF_CHROOT_SESSION_DIR_PATH}"

	sudo mkdir -p "${REF_CHROOT_SESSION_DIR_PATH}"

	return 0
}

sys_chroot_session_prepare_file () {


	sudo cp -rfT "${REF_MASTER_ASSET_DIR_PATH}" "${REF_CHROOT_SESSION_DIR_PATH}/${REF_MASTER_ASSET_DIR_NAME}"
	sudo cp -rfT "${REF_MASTER_FACTORY_DIR_PATH}" "${REF_CHROOT_SESSION_DIR_PATH}/${REF_MASTER_FACTORY_DIR_NAME}"
	sudo cp -rfT "${REF_MASTER_BASIC_DIR_PATH}" "${REF_CHROOT_SESSION_DIR_PATH}/${REF_MASTER_BASIC_DIR_NAME}"


	sudo cp -rfT "${REF_MASTER_CYCLE_DIR_PATH}" "${REF_CHROOT_SESSION_DIR_PATH}/${REF_MASTER_CYCLE_DIR_NAME}"
	sudo cp -rfT "${REF_MASTER_OPTION_DIR_PATH}" "${REF_CHROOT_SESSION_DIR_PATH}/${REF_MASTER_OPTION_DIR_NAME}"


	return 0
}

sys_chroot_session_process () {

	local script_file_path="${REF_ATCHROOT_SESSION_START_FILE_PATH}"

	sys_chroot_run ${script_file_path}

	return 0
}

##
### Tail: Master / Sys / Chroot / Session
################################################################################
