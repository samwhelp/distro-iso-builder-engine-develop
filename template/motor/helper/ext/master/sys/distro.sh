

################################################################################
### Head: Master / Sys / Distro
##




##
### Tail: Master / Sys / Distro
################################################################################


################################################################################
### Head: Master / Sys / Distro / Dir
##

sys_distro_dir_create () {

	mkdir -p "${REF_DISTRO_IMG_DIR_PATH}"
	mkdir -p "${REF_DISTRO_ISO_DIR_PATH}"
	mkdir -p "${REF_DISTRO_DIST_DIR_PATH}"

	return 0
}

##
### Tail: Master / Sys / Distro / Dir
################################################################################


################################################################################
### Head: Master / Sys / Distro / Base System
##

sys_distro_base_system_create () {

	sys_distro_dir_create

	sudo debootstrap \
		--arch=amd64 --variant=minbase $TARGET_UBUNTU_VERSION new_building_os $BUILD_UBUNTU_MIRROR


	return 0
}

##
### Tail: Master / Sys / Distro / Base System
################################################################################


################################################################################
### Head: Master / Sys / Distro / Img
##

sys_distro_img_archive () {


	return 0
}

sys_distro_img_extract () {


	return 0
}

##
### Tail: Master / Sys / Distro / Img
################################################################################


################################################################################
### Head: Master / Sys / Distro / Iso
##

sys_distro_iso_archive () {


	return 0
}

sys_distro_iso_extract () {


	return 0
}

##
### Tail: Master / Sys / Distro / Iso
################################################################################
