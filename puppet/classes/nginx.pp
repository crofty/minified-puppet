class nginx {
	package { nginx: ensure => installed }

  # Create the server as a virtual resource, so config instances
  # can enable it.
  @service { nginx:
      ensure => running,
      enable => true
  }

  define config() {
      file { "/etc/nginx/nginx.conf":
          content => template("nginx/nginx.conf.erb"),
          mode => 644,
          owner => root,
          notify => Service[nginx]
      }
      realize Service[nginx]
  }

  define vhost(
    $url,
    $name,
    $port
    
    ) {
      file {"/etc/nginx/sites-available/${url}.conf":
          content => template("nginx/vhost.erb"),
          mode => 644,
          owner => root
          #notify => Service[nginx]
      }

      file {"/etc/nginx/sites-enabled/${url}.conf":
          ensure => "/etc/nginx/sites-available/${url}.conf"
      }

      #realize Service[nginx]
  }



}
