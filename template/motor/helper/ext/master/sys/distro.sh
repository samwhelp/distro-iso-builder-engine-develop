

################################################################################
### Head: Master / Sys / Distro
##




##
### Tail: Master / Sys / Distro
################################################################################


################################################################################
### Head: Master / Sys / Distro / Build Prepare
##


##
### Tail: Master / Sys / Distro / Build Prepare
################################################################################


################################################################################
### Head: Master / Sys / Distro / File
##

sys_distro_file_clean () {

	rm -rf "${REF_DISTRO_IMG_DIR_PATH}"
	rm -rf "${REF_DISTRO_ISO_DIR_PATH}"
	rm -rf "${REF_DISTRO_DIST_DIR_PATH}"

	return 0
}

##
### Tail: Master / Sys / Distro / File
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
		${REF_BUILD_PACKAGE_REPO_URL}


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


	##
	## ## Notice: iso_volume_id (all characters must uppercase)
	##

	local iso_volume_id="${3}"
	iso_volume_id="${iso_volume_id^^}"


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
### Head: Master / Sys / Distro / Iso / Create / Grub Config
##

sys_distro_iso_create_grub_cfg () {


	##
	## --output="isolinux/grub.cfg" \
	##

	local grub_cfg_file_path="${1}"
	local menu_entry_subject_name="${2}"


	##
	## ## Notice: iso_volume_id (all characters must uppercase)
	##

	local iso_volume_id="${3}"
	iso_volume_id="${iso_volume_id^^}"




cat > "${grub_cfg_file_path}" << __EOF__

search --set=root --file /${iso_volume_id}

insmod all_video

set default="0"
set timeout=10

menuentry "${menu_entry_subject_name}" {
	set gfxpayload=keep
	linux   /casper/vmlinuz boot=casper nopersistent quiet splash ---
	initrd  /casper/initrd
}

menuentry "${menu_entry_subject_name} (Safe Graphics)" {
	set gfxpayload=keep
	linux   /casper/vmlinuz boot=casper nopersistent nomodeset ---
	initrd  /casper/initrd
}

if [ "\$grub_platform" == "efi" ]; then
	menuentry "Boot from next volume" {
		exit 1
	}

	menuentry "UEFI Firmware Settings" {
		fwsetup
	}
fi
__EOF__




	return 0
}


##
### Tail: Master / Sys / Distro / Iso / Create / Grub Config
################################################################################


################################################################################
### Head: Master / Sys / Distro / Iso / Create / Boot Image
##

sys_distro_iso_create_boot_image_for_hybrid () {

	##
	## --output="isolinux/bios.img" \
	##

	local cdboot_img_file_path="/usr/lib/grub/i386-pc/cdboot.img"
	local core_img_file_path="${1}"
	local bios_img_file_path="${2}"


	cat "${cdboot_img_file_path}" "${core_img_file_path}" > "${bios_img_file_path}"

	return 0
}

sys_distro_iso_create_boot_image_for_bios () {

	local boot_image_file_path="${1}"

	sys_distro_iso_create_boot_image_for_bios_via_grub_mkstandalone "${boot_image_file_path}"

	return 0
}

sys_distro_iso_create_boot_image_for_uefi () {

	local boot_image_file_path="${1}"

	#sys_distro_iso_create_boot_image_for_uefi_via_grub_install "${boot_image_file_path}"

	sys_distro_iso_create_boot_image_for_uefi_via_grub_mkimage "${boot_image_file_path}"

	return 0
}

sys_distro_iso_create_boot_image_for_bios_via_grub_mkstandalone () {

	local boot_image_file_path="${1}"


	##
	## --output="isolinux/core.img" \
	##

	grub-mkstandalone \
		--format=i386-pc \
		--output="${boot_image_file_path}" \
		--install-modules="linux16 linux normal iso9660 biosdisk memdisk search tar ls" \
		--modules="linux16 linux normal iso9660 biosdisk search" \
		--locales="" \
		--fonts="" \
		"boot/grub/grub.cfg=isolinux/grub.cfg"


	return 0
}

sys_distro_iso_create_boot_image_for_uefi_via_grub_mkimage () {

	local boot_image_file_path="${1}"


	##
	## --output="isolinux/efiboot.img" \
	##

	sudo grub-mkimage \
		--format="x86_64-efi" \
		--output="${boot_image_file_path}" \
		--directory="/usr/lib/grub/x86_64-efi" \
		--prefix="/EFI" \
			fat \
			iso9660 \
			part_gpt \
			part_msdos \
			normal \
			boot \
			linux \
			linux16 \
			configfile \
			loopback \
			chain \
			efifwsetup \
			efi_gop \
			efi_uga \
			ls \
			search \
			search_label \
			search_fs_uuid \
			search_fs_file \
			gfxterm \
			gfxterm_background \
			gfxterm_menu \
			test \
			all_video \
			loadenv \
			exfat \
			ext2 \
			ntfs \
			btrfs \
			hfsplus \
			udf \
			cat


	return 0
}

sys_distro_iso_create_boot_image_for_uefi_via_grub_install () {

	return 0
}


##
### Tail: Master / Sys / Distro / Iso / Create / Boot Image
################################################################################


################################################################################
### Head: Master / Sys / Distro / Iso / Create / Kernel
##

sys_distro_iso_create_kernel_via_copy () {

	local source_dir_path="${1}"
	local target_dir_path="${2}"

	mkdir -p "${source_dir_path}"
	mkdir -p "${target_dir_path}"

	rm -f "${target_dir_path}"/vmlinuz
	rm -f "${target_dir_path}"/initrd

	cp -f "${source_dir_path}"/vmlinuz-**-**-generic "${target_dir_path}"/vmlinuz
	cp -f "${source_dir_path}"/initrd.img-**-**-generic "${target_dir_path}"/initrd

	return 0
}

##
### Tail: Master / Sys / Distro / Iso / Create / Kernel
################################################################################


################################################################################
### Head: Master / Sys / Distro / Iso / Create / Manifest
##

sys_distro_iso_create_manifest () {

	local distro_img_dir_path="${1}"
	local distro_iso_dir_path="${2}"

	local source_dir_path="${distro_img_dir_path}"
	local target_dir_path="${distro_iso_dir_path}/casper"

	mkdir -p "${source_dir_path}"
	mkdir -p "${target_dir_path}"

	sudo chroot "${source_dir_path}" dpkg-query -W --showformat='${Package} ${Version}\n' | sudo tee "${target_dir_path}/filesystem.manifest" >/dev/null 2>&1

	return 0
}

##
### Tail: Master / Sys / Distro / Iso / Create / Manifest
################################################################################


################################################################################
### Head: Master / Sys / Distro / Iso / Create / Filesystem Size
##

sys_distro_iso_create_filesystem_size () {

	local distro_img_dir_path="${1}"
	local distro_iso_dir_path="${2}"

	local source_dir_path="${distro_img_dir_path}"
	local target_dir_path="${distro_iso_dir_path}/casper"

	mkdir -p "${source_dir_path}"
	mkdir -p "${target_dir_path}"

	printf $(du -sx --block-size=1 "${source_dir_path}" | cut -f1) > "${target_dir_path}/filesystem.size"

	return 0
}

##
### Tail: Master / Sys / Distro / Iso / Create / Filesystem Size
################################################################################
