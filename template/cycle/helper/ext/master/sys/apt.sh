

################################################################################
### Head: Master / Sys / Apt
##

sys_apt_source_list_create_simple () {

	util_apt_source_list_create_simple "${REF_PACKAGE_REPO_URL}" "${REF_BUILD_SUITE}"

}

sys_apt_package_db_update () {

	util_error_echo
	util_error_echo apt-get update
	util_error_echo
	apt-get update

}

##
### Tail: Master / Sys / Apt
################################################################################
