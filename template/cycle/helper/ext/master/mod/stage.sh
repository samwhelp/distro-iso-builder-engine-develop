

################################################################################
### Head: Master / Mod / Stage
##

mod_stage_rundown_process_all () {

	mod_stage_rundown_process_skeleton_head

	mod_stage_rundown_process_factory_install

	mod_stage_rundown_process_skeleton_middle

	mod_stage_rundown_process_master_install

	mod_stage_rundown_process_skeleton_tail

}



mod_stage_rundown_process_factory_install () {



	local module_root_dir_path="${REF_MAIN_DIR_PATH}/stage/module"

	local rundown_file_path="${REF_MAIN_DIR_PATH}/stage/rundown/factory-install.txt"

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## [Rundown]: ${rundown_file_path}"
	util_error_echo "##"
	util_error_echo

	#util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"
	#util_stage_rundown_process "${rundown_file_path}"

	#util_stage_rundown_process "${rundown_file_path}"

	util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"

}


mod_stage_rundown_process_master_install () {



	local module_root_dir_path="${REF_MAIN_DIR_PATH}/stage/module"

	local rundown_file_path="${REF_MAIN_DIR_PATH}/stage/rundown/master-install.txt"

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## [Rundown]: ${rundown_file_path}"
	util_error_echo "##"
	util_error_echo

	#util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"
	#util_stage_rundown_process "${rundown_file_path}"

	#util_stage_rundown_process "${rundown_file_path}"

	util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"

}


mod_stage_rundown_process_skeleton_head () {



	local module_root_dir_path="${REF_MAIN_DIR_PATH}/stage/module"

	local rundown_file_path="${REF_MAIN_DIR_PATH}/stage/rundown/skeleton-head.txt"

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## [Rundown]: ${rundown_file_path}"
	util_error_echo "##"
	util_error_echo

	#util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"
	#util_stage_rundown_process "${rundown_file_path}"

	#util_stage_rundown_process "${rundown_file_path}"

	util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"

}



mod_stage_rundown_process_skeleton_tail () {



	local module_root_dir_path="${REF_MAIN_DIR_PATH}/stage/module"

	local rundown_file_path="${REF_MAIN_DIR_PATH}/stage/rundown/skeleton-tail.txt"

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## [Rundown]: ${rundown_file_path}"
	util_error_echo "##"
	util_error_echo

	#util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"
	#util_stage_rundown_process "${rundown_file_path}"

	#util_stage_rundown_process "${rundown_file_path}"

	util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"

}



mod_stage_rundown_process_skeleton_middle () {



	local module_root_dir_path="${REF_MAIN_DIR_PATH}/stage/module"

	local rundown_file_path="${REF_MAIN_DIR_PATH}/stage/rundown/skeleton-middle.txt"

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## [Rundown]: ${rundown_file_path}"
	util_error_echo "##"
	util_error_echo

	#util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"
	#util_stage_rundown_process "${rundown_file_path}"

	#util_stage_rundown_process "${rundown_file_path}"

	util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"

}

##
### Tail: Master / Mod / Stage
################################################################################
