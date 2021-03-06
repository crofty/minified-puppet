class minified {

  define user($user, $key, $key_type="ssh-rsa") {
    include base::application

    user {$user:
      gid => "application",
      require => User[application],
      shell => '/bin/bash'
    }

    file { "/home/$user":
      ensure => directory,
      owner => $user,
      group => application,
      require => User[$user]
    }

    ssh_authorized_key { $name:
      ensure => present,
      user => $user,
      key => $key,
      name => $name,
      target => "/home/$user/.ssh/authorized_keys",
      type => $key_type,
      require => [File["/home/$user"], User[$user]],
    }
  }
}
