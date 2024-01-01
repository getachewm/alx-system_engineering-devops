#!/usr/bin/env bash
# using puppet to make changes in our config file

file { 'etc/ssh/ssh_config':
	ensure => present,
}

file line { 'Turn off password auth':
 path	=> '/etc/ssh/ssh_config',
 line	=> 'PasswordAuthentication no',
 match	=> '^#PasswordAuthentication',
}

file line { 'Declare identity file':
 path    => '/etc/ssh/ssh_config',
 line    => 'IdentityFile ~/.ssh/school',
 match   => '^#IdentityFile',
}
