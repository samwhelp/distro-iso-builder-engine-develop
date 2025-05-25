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
### Head: Portal / portal_prepare
##

portal_prepare () {

	util_error_echo "portal_prepare"

	mod_main_signal_bind

	sleep 10;

}

##
### Tail: Portal / portal_prepare
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	portal_prepare "${@}"

}

__main__ "${@}"

##
### Tail: Main
################################################################################
