stage { "pre-flight": before => Stage[main] }
class { "base": stage => "pre-flight" }

class base {
  include base::time
  include base::application

  class time {
    file { "/etc/localtime":
      source => "/usr/share/zoneinfo/Europe/London"
    }
    
    package {"ntp":
      ensure => present
    }
    
    service {"ntpd":
      ensure => running,
      require => Package["ntp"]
    }
  }

  class application {
    user {"application":
      shell => "/bin/false"
    }

    file { "/var/apps":
      ensure => directory,
      owner => root,
      group => application,
      require => [User[application]],
      mode => 771
    }
  }

}
