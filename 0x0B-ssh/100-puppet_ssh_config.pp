#!/usr/bin/env puppet

# Ensure SSH client configuration is managed

file { '/etc/ssh/ssh_config':
  ensure  => present,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
}

# Configure PasswordAuthentication
file_line { 'Turn off password auth':
  path   => '/etc/ssh/ssh_config',
  line   => 'PasswordAuthentication no',
  match  => '^#?PasswordAuthentication',
}

# Configure IdentityFile
file_line { 'Declare identity file':
  path   => '/etc/ssh/ssh_config',
  line   => 'IdentityFile ~/.ssh/school',
  match  => '^#?IdentityFile',
}

# Ensure proper permissions for the private key
file { '/home/user/.ssh/school':
  ensure  => present,
  owner   => 'user',
  group   => 'user',
  mode    => '0600',
}
