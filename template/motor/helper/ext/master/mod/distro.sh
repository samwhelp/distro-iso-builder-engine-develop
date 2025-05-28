

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
	local iso_volume_id="TESTID"

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


	##
	## ## create dir
	##

	mod_distro_iso_create_base_dir


	##
	## ## copy kernel
	##

	mod_distro_iso_create_kernel



	##
	## ## boot files
	##

	mod_distro_iso_create_grub_cfg

	mod_distro_iso_create_boot_image_for_bios

	mod_distro_iso_create_boot_image_for_hybrid

	mod_distro_iso_create_boot_image_for_uefi


	##
	## ## archive iso files finally
	##

	mod_distro_iso_archive


	return 0
}



##
### Tail: Master / Mod / Distro / Iso / Build
################################################################################


################################################################################
### Head: Master / Mod / Distro / Iso / Create / Base Dir
##

mod_distro_iso_create_base_dir () {

	local distro_iso_dir_path="${REF_DISTRO_ISO_DIR_PATH}"

	sudo rm -rf "${distro_iso_dir_path}"

	sudo mkdir -p "${distro_iso_dir_path}"/{casper,isolinux,.disk}

}

##
### Tail: Master / Mod / Distro / Iso / Create / Base Dir
################################################################################


################################################################################
### Head: Master / Mod / Distro / Iso / Create / Grub Config
##

mod_distro_iso_create_grub_cfg () {

	local grub_cfg_file_path="${REF_DISTRO_ISO_DIR_PATH}/isolinux/grub.cfg"
	local menu_entry_subject_name="Demo OS"
	local iso_volume_id="TESTID"

	sys_distro_iso_create_grub_cfg "${grub_cfg_file_path}" "${menu_entry_subject_name}" "${iso_volume_id}"

	return 0
}


##
### Tail: Master / Mod / Distro / Iso / Create / Grub Config
################################################################################


################################################################################
### Head: Master / Mod / Distro / Iso / Create / Boot Image
##

mod_distro_iso_create_boot_image_for_hybrid () {

	local core_img_file_path="${REF_DISTRO_ISO_DIR_PATH}/isolinux/core.img"
	local bios_img_file_path="${REF_DISTRO_ISO_DIR_PATH}/isolinux/bios.img"

	sys_distro_iso_create_boot_image_for_hybrid "${core_img_file_path}" "${bios_img_file_path}"

	return 0
}

mod_distro_iso_create_boot_image_for_bios () {

	local boot_image_file_path="${REF_DISTRO_ISO_DIR_PATH}/isolinux/core.img"

	sys_distro_iso_create_boot_image_for_bios "${boot_image_file_path}"


	return 0
}


mod_distro_iso_create_boot_image_for_uefi () {

	local boot_image_file_path="${REF_DISTRO_ISO_DIR_PATH}/isolinux/efiboot.img"

	sys_distro_iso_create_boot_image_for_uefi "${boot_image_file_path}"

	return 0
}

##
### Tail: Master / Mod / Distro / Iso / Create / Boot Image
################################################################################


################################################################################
### Head: Master / Mod / Distro / Iso / Create / Kernel
##

mod_distro_iso_create_kernel () {

	local source_dir_path="${REF_DISTRO_IMG_DIR_NAME}/boot"
	local target_dir_path="${REF_DISTRO_ISO_DIR_PATH}/casper"

	sys_distro_iso_create_kernel_via_copy "${source_dir_path}" "${target_dir_path}"

	return 0
}

##
### Tail: Master / Mod / Distro / Iso / Create / Kernel
################################################################################

