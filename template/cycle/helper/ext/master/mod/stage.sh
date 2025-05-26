

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

	local module_root_dir_path="${REF_MASTER_STAGE_MODULE_DIR_PATH}"

	local rundown_file_path="${REF_MASTER_STAGE_RUNDOWN_DIR_PATH}/factory-install.txt"


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Rundown"
	util_error_echo "##"
	util_error_echo
	util_error_echo
	util_error_echo "[Rundown]: ${rundown_file_path}"
	util_error_echo


	util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"

}


mod_stage_rundown_process_master_install () {

	local module_root_dir_path="${REF_MASTER_STAGE_MODULE_DIR_PATH}"

	local rundown_file_path="${REF_MASTER_STAGE_RUNDOWN_DIR_PATH}/master-install.txt"


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Rundown"
	util_error_echo "##"
	util_error_echo
	util_error_echo
	util_error_echo "[Rundown]: ${rundown_file_path}"
	util_error_echo


	util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"

}


mod_stage_rundown_process_skeleton_head () {

	local module_root_dir_path="${REF_MASTER_STAGE_MODULE_DIR_PATH}"

	local rundown_file_path="${REF_MASTER_STAGE_RUNDOWN_DIR_PATH}/skeleton-head.txt"


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Rundown"
	util_error_echo "##"
	util_error_echo
	util_error_echo
	util_error_echo "[Rundown]: ${rundown_file_path}"
	util_error_echo


	util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"

}



mod_stage_rundown_process_skeleton_tail () {

	local module_root_dir_path="${REF_MASTER_STAGE_MODULE_DIR_PATH}"

	local rundown_file_path="${REF_MASTER_STAGE_RUNDOWN_DIR_PATH}/skeleton-tail.txt"


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Rundown"
	util_error_echo "##"
	util_error_echo
	util_error_echo
	util_error_echo "[Rundown]: ${rundown_file_path}"
	util_error_echo


	util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"

}



mod_stage_rundown_process_skeleton_middle () {

	local module_root_dir_path="${REF_MASTER_STAGE_MODULE_DIR_PATH}"

	local rundown_file_path="${REF_MASTER_STAGE_RUNDOWN_DIR_PATH}/skeleton-middle.txt"


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Rundown"
	util_error_echo "##"
	util_error_echo
	util_error_echo
	util_error_echo "[Rundown]: ${rundown_file_path}"
	util_error_echo


	util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"

}

##
### Tail: Master / Mod / Stage
################################################################################
