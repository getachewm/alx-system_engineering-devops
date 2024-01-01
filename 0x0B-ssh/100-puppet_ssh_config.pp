#!/usr/bin/env bash
# using puppet to make changes in our config file

file  { 'ect/ssh/ssh_config':
	ensure => present,

content =>"

	#SSH client configuration
	host*
	IdentityFile ~/.ssh/school
	PasswordAuthentication no
	",
}
