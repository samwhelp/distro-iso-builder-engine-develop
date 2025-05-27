

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
		--arch=${REF_BUILD_ARCH} \
		--variant=minbase \
		--include=${REF_BUILD_INCLUDE} \
		${REF_BUILD_SUITE} \
		${REF_DISTRO_IMG_DIR_PATH} \
		${REF_PACKAGE_REPO_URL}


	return 0
}

##
### Tail: Master / Sys / Distro / Base System
################################################################################


################################################################################
### Head: Master / Sys / Distro / Img
##

sys_distro_img_archive () {

	local squashfs_dir_path="${1}"
	local squashfs_file_path="${2}"

	sudo mksquashfs "${squashfs_dir_path}" "${squashfs_file_path}" \
		-noappend \
		-no-duplicates \
		-no-recovery \
		-wildcards \
		-b 1M \
		-comp zstd \
		-Xcompression-level 19 \
		-e "var/cache/apt/archives/*" \
		-e "root/*" \
		-e "root/.*" \
		-e "tmp/*" \
		-e "tmp/.*" \
		-e "swapfile"


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

	local iso_dir_path="${1}"
	local iso_file_path="${2}"
	local iso_volume_id="${3}"


	util_error_echo
	util_error_echo cd "${iso_dir_path}"
	util_error_echo
	cd "${iso_dir_path}"
	util_error_echo


	sys_distro_iso_archive_pre


	sudo xorriso \
		-as mkisofs \
		-iso-level 3 \
		-full-iso9660-filenames \
		-volid "${iso_volume_id}" \
		-eltorito-boot boot/grub/bios.img \
			-no-emul-boot \
			-boot-load-size 4 \
			-boot-info-table \
			--eltorito-catalog boot/grub/boot.cat \
			--grub2-boot-info \
			--grub2-mbr /usr/lib/grub/i386-pc/boot_hybrid.img \
		-eltorito-alt-boot \
			-e EFI/efiboot.img \
			-no-emul-boot \
			-append_partition 2 0xef isolinux/efiboot.img \
		-output "${iso_file_path}" \
		-m "isolinux/efiboot.img" \
		-m "isolinux/bios.img" \
		-graft-points \
			"/EFI/efiboot.img=isolinux/efiboot.img" \
			"/boot/grub/grub.cfg=isolinux/grub.cfg" \
			"/boot/grub/bios.img=isolinux/bios.img" \
			"."


	sys_distro_iso_archive_post


	util_error_echo
	util_error_echo cd "${OLDPWD}"
	util_error_echo
	cd "${OLDPWD}"
	util_error_echo


	return 0
}

sys_distro_iso_extract () {


	return 0
}

##
### Tail: Master / Sys / Distro / Iso
################################################################################


################################################################################
### Head: Master / Sys / Distro / Iso / Archive
##

sys_distro_iso_archive_pre () {

	return 0
}

sys_distro_iso_archive_post () {

	return 0
}

##
### Tail: Master / Sys / Distro / Iso / Archive
################################################################################


################################################################################
### Head: Master / Sys / Distro / Iso / Create
##

sys_distro_iso_create_boot_image_for_bios () {

	sys_distro_iso_create_boot_image_for_bios_via_grub_mkstandalone

	return 0
}

sys_distro_iso_create_boot_image_for_uefi () {

	#sys_distro_iso_create_boot_image_for_uefi_via_grub_install

	sys_distro_iso_create_boot_image_for_uefi_via_grub_mkimage

	return 0
}

sys_distro_iso_create_boot_image_for_bios_via_grub_mkstandalone () {

	return 0
}


sys_distro_iso_create_boot_image_for_uefi_via_grub_install () {

	return 0
}

sys_distro_iso_create_boot_image_for_uefi_via_grub_mkimage () {

	return 0
}


##
### Tail: Master / Sys / Distro / Iso / Create
################################################################################
