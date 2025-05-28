

################################################################################
### Head: Master / Mod / Apt
##

mod_apt_source_list_create_for_building () {

	sys_apt_source_list_create_simple > "/etc/apt/sources.list"

}

mod_apt_package_db_update () {

	sys_apt_package_db_update

}

mod_apt_package_db_update_for_build_start () {

	mod_apt_source_list_create_for_building

	sys_apt_package_db_update

}

##
### Tail: Master / Mod / Apt
################################################################################
