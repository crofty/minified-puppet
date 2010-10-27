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

  define plugin($config, $content) {
    include munin::client

    file {"/etc/munin/plugins/$name":
      content => $content,
      mode => 777,
      require => Package["munin-node"],
      notify => Service["munin-node"]
    }

    file {"/etc/munin/plugin-conf.d/$name":
      content => "[$name]\n$config",
      require => Package["munin-node"],
      notify => Service["munin-node"]
    }
  }


  define rails($log) {

    package {"request-log-analyzer":
      ensure => present,
      provider => gem
    }

    munin::plugin {"$name-rails-requests":
      config => template("munin/rails-plugin-config"),
      content => template("munin/plugins/rails_requests")
    }

    munin::plugin {"$name-rails-request-duration":
      config => template("munin/rails-plugin-config"),
      content => template("munin/plugins/rails_request_duration")
    }

    munin::plugin {"$name-rails-request-error":
      config => template("munin/rails-plugin-config"),
      content => template("munin/plugins/rails_request_error")
    }

    munin::plugin {"$name-rails-view-render-time":
      config => template("munin/rails-plugin-config"),
      content => template("munin/plugins/rails_view_render_time")
    }
  }



}
