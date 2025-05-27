#!/usr/bin/env bash


################################################################################
### Head: Note
##

##
## ## Link
##
## * https://github.com/samwhelp/skel-project-plan/blob/master/develop/sh/project-helper/basic/helper/bin/prepare.sh
##


##
## https://stackoverflow.com/questions/6674327/redirect-all-output-to-file-in-bash
##
## ``` sh
## make 2>&1 | tee file.txt
## ```
##
## ``` sh
## make build 2>&1 | tee log.txt
## ```


##
### Tail: Note
################################################################################


################################################################################
### Head: Init
##

#REF_CMD_FILE_NAME="$(basename "${0}")"
REF_BASE_DIR_PATH="$(cd -- "$(dirname -- "${0}")" ; pwd)"
REF_INIT_DIR_PATH="${REF_BASE_DIR_PATH}/../ext"
. "${REF_INIT_DIR_PATH}/init.sh"

##
### Tail: Init
################################################################################


################################################################################
### Head: Portal / portal_build
##

portal_build () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## portal_build"
	util_error_echo "##"
	util_error_echo

	local script_file_path="${REF_MAIN_BIN_DIR_PATH}/build.sh"
	local log_file_path="${REF_MASTER_LOG_FILE_PATH}"

	util_error_echo
	util_error_echo sudo "${script_file_path}"
	util_error_echo
	sudo "${script_file_path}"

	## ./build.sh" 2>&1 | tee log.txt
	"${script_file_path}" 2>&1 | tee "${log_file_path}"

	return 0

}

##
### Tail: Portal / portal_build
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	portal_build "${@}"

}

__main__ "${@}"

##
### Tail: Main
################################################################################
