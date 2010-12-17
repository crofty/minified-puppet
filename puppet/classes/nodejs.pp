class nodejs {

  define nodejs_source(
    $version = 'v0.2.5',
    $path = '/usr/local/src',
    $bin = '/usr/local/bin'
  ) {

    file { nodejs_folder:
      path => "${path}/nodejs_${version}",
      ensure => "directory",
      owner => root,
      group => root
    }

    exec { nodejs_code: 
      command =>"wget http://nodejs.org/dist/node-${version}.tar.gz -O nodejs_${version}.tar.gz && tar --strip-components 1 -xzvf nodejs_${version}.tar.gz",
      cwd => "${path}/nodejs_${version}",
      creates => "${path}/nodejs_${version}/Makefile",
      require => File["nodejs_folder"],
      before => Exec["make ${version}"]
    }

    file { "${path}/nodejs_${version}/nodejs_${version}.tar.gz":
      ensure => absent,
      require => Exec["nodejs_code"]
    }
    exec { "make ${version}":
      command => "/bin/sh -c 'cd ${path}/nodejs_${version} && ./configure && make && make install'",
      creates => "${bin}/node",
    }
  }
  
  user { "nodejs":
    ensure => present
  }

  nodejs_source {"nodejs_source":
    require => User["nodejs"]
  }
}


