#!/usr/bin/env bash


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
### Head: Main
##

__main__ () {

cat << EOF

Usage:

	$ make [action]

Example:

	$ make
	$ make help

	$ make prepare


Debug:
	$ export DEBUG_HELPER=true

EOF

}

__main__ "${@}"

##
### Tail: Main
################################################################################
