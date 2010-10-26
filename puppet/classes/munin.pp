class munin {

  class host {
    package { "munin":
      ensure => installed
    }
    service { "munin": 
      require => Package["munin"],
      ensure => running 
    }
  }

  class client{
    package { "munin-node":
      ensure => installed
    }
    service { "munin-node": 
      require => Package["munin-node"],
      ensure => running 
    }
  }

}
