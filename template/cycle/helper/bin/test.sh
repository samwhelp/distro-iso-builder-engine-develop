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

REF_BASE_DIR_PATH="$(cd -- "$(dirname -- "${0}")" ; pwd)"
REF_INIT_DIR_PATH="${REF_BASE_DIR_PATH}/../ext"
. "${REF_INIT_DIR_PATH}/init.sh"

##
### Tail: Init
################################################################################


################################################################################
### Head: Model / mod_test
##

mod_test () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## mod_test"
	util_error_echo "##"
	util_error_echo




	mod_main_signal_bind

	sleep 10;

}

##
### Tail: Model / mod_test
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	mod_test "${@}"

}

__main__ "${@}"

##
### Tail: Main
################################################################################
