class postfix {

  package {"postfix":
    ensure => present
  }
  package {"heirloom-mailx":
    ensure => present
  }

}
