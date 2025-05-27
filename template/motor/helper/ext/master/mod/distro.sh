

################################################################################
### Head: Master / Mod / Distro
##




##
### Tail: Master / Mod / Distro
################################################################################


################################################################################
### Head: Master / Mod / Distro / Base System
##

mod_distro_base_system_create () {


	return 0
}

##
### Tail: Master / Mod / Distro / Base System
################################################################################


################################################################################
### Head: Master / Mod / Distro / Img
##

mod_distro_img_archive () {

	local squashfs_root_dir_path="${REF_DISTRO_ISO_DIR_PATH}/casper"

	sudo mkdir -p "${squashfs_root_dir_path}"

	local squashfs_dir_path="${REF_DISTRO_IMG_DIR_PATH}"
	local squashfs_file_path="${squashfs_root_dir_path}/filesystem.squashfs"

	sys_distro_img_archive "${squashfs_dir_path}" "${squashfs_file_path}"


	return 0
}

mod_distro_img_extract () {


	return 0
}

##
### Tail: Master / Mod / Distro / Img
################################################################################


################################################################################
### Head: Master / Mod / Distro / Iso
##

mod_distro_iso_archive () {

	local iso_dir_path="${REF_DISTRO_ISO_DIR_PATH}"
	local iso_file_path="${REF_MASTER_TMP_DIR_PATH}/test.iso"
	local iso_volume_id="TestId"

	sys_distro_iso_archive "${iso_dir_path}" "${iso_file_path}" "${iso_volume_id}"

	return 0
}

mod_distro_iso_extract () {


	return 0
}

##
### Tail: Master / Mod / Distro / Iso
################################################################################


################################################################################
### Head: Master / Mod / Distro / Iso / Build
##

mod_distro_iso_build () {

	sys_distro_iso_create_boot_image_for_bios

	sys_distro_iso_create_boot_image_for_uefi

	mod_distro_iso_archive

	return 0
}



##
### Tail: Master / Mod / Distro / Iso / Build
################################################################################
