

################################################################################
### Head: Master / Mod / Test
##

mod_test_util_text_file_list_load () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## mod_test_util_text_file_list_load"
	util_error_echo "##"
	util_error_echo

	local list_file_path="${REF_MAIN_DIR_PATH}/../../asset/package/install/text-editor.txt"

	echo "${list_file_path}"

	local list=$(util_text_file_list_load "${list_file_path}")

	echo "${list}"

}


mod_test_util_stage_rundown_process () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## mod_test_util_stage_rundown_process"
	util_error_echo "##"
	util_error_echo

	local module_root_dir_path="${REF_MAIN_DIR_PATH}/stage/module"

	local rundown_file_path="${REF_MAIN_DIR_PATH}/stage/rundown/master-package-install.txt"

	echo "${rundown_file_path}"

	#util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"
	#util_stage_rundown_process "${rundown_file_path}"

	#util_stage_rundown_process "${rundown_file_path}"

	util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"

}


##
### Tail: Master / Mod / Test
################################################################################
