

################################################################################
### Head: Master / Mod / Kernel
##

mod_kernel_package_install () {

	local package_install_list="$(sys_kernel_package_name_find)"


	util_error_echo
	util_error_echo apt-get install -y --no-install-recommends ${package_install_list}
	util_error_echo
	apt-get install -y --no-install-recommends ${package_install_list}


	return 0
}


##
### Tail: Master / Mod / Kernel
################################################################################
