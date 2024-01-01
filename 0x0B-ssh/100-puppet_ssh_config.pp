#!/usr/bin/env bash
# using puppet to make changes in our config file

file  {'etc/ssh/ssh_config':
	ensure => present,

contents =>"

	#SSH client configuration
	host*
	IdentityFile -/.ssh/school
	PasswordAuthentication no
	",
}