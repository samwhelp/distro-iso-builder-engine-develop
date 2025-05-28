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
### Tail: Note
################################################################################


################################################################################
### Head: Init
##

REF_CMD_FILE_NAME="$(basename "${0}")"
REF_BASE_DIR_PATH="$(cd -- "$(dirname -- "${0}")" ; pwd)"
REF_INIT_DIR_PATH="${REF_BASE_DIR_PATH}/../ext"
. "${REF_INIT_DIR_PATH}/init.sh"

##
### Tail: Init
################################################################################



################################################################################
### Head: Main / Mod / Signal / Override
##

mod_action_on_exit () {

	sys_action_on_exit

	mod_distro_unmount_for_chroot

	exit 0
}

##
### Tail: Main / Mod / Signal / Override
################################################################################


################################################################################
### Head: Portal / portal_steps
##

portal_steps () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## portal_steps"
	util_error_echo "##"
	util_error_echo




	mod_main_signal_bind

	mod_limit_root_user_required



	mod_distro_unmount_for_chroot
	#mod_stage_rundown_process_all




	return 0
}

##
### Tail: Portal / portal_steps
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	portal_steps "${@}"

}

__main__ "${@}"

##
### Tail: Main
################################################################################
