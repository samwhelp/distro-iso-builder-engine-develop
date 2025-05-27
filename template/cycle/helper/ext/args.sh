

################################################################################
### Head: Args
##

args_var_init () {

	##
	## ## Load Args File
	##

	[ -f "${REF_MASTER_OPTION_ARGS_FILE_PATH}" ] && . "${REF_MASTER_OPTION_ARGS_FILE_PATH}"

	[ -f "${REF_MASTER_OPTION_ARGS_OVERRIDE_FILE_PATH}" ] && . "${REF_MASTER_OPTION_ARGS_OVERRIDE_FILE_PATH}"


	return 0
}

args_var_dump () {


	is_not_debug && return 0




	util_debug_echo
	util_debug_echo "################################################################################"
	util_debug_echo "### Head: args_var_dump"
	util_debug_echo "##"
	util_debug_echo


	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Args From File"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "REF_BUILD_SUITE=${REF_BUILD_SUITE}"
	util_debug_echo "REF_PACKAGE_REPO_URL=${REF_PACKAGE_REPO_URL}"
	util_debug_echo



	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "### Tail: args_var_dump"
	util_debug_echo "################################################################################"
	util_debug_echo


	util_debug_echo
	util_debug_echo
	util_debug_echo




	return 0
}


##
### Head: Args
################################################################################
