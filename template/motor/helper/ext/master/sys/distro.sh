

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


	return 0
}

sys_distro_iso_extract () {


	return 0
}

##
### Tail: Master / Sys / Distro / Iso
################################################################################
