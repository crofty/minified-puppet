class ruby {

  define ruby_source(
    $version = '1.9.3-p0'
  ){
    file { src_folder:
       path => "/tmp/src",
       ensure => "directory"
    }

    package { "libyaml-dev":; }

    exec { ruby_code:
      command => "wget ftp://ftp.ruby-lang.org//pub/ruby/1.9/ruby-${version}.tar.gz && tar -xvf ruby-${version}.tar.gz",
      cwd => "/tmp/src",
      creates => "/tmp/src/ruby-${version}",
      require => [File["src_folder"], Package["libyaml-dev"]],
      before => Exec["make ${version}"],
      unless => "which ruby"
    }
    exec { "make ${version}":
      command => "/bin/sh -c 'cd /tmp/src/ruby-${version} && ./configure && make'",
      timeout => 0,
      creates => "/tmp/src/ruby-${version}/Makefile",
      before => Exec["make install ${version}"],
      unless => "which ruby"
    }
    exec { "make install ${version}":
      command => "make install",
      cwd => "/tmp/src/ruby-${version}",
      require => Exec["make ${version}"],
      unless => "which ruby"
    }

    exec { "ruby open sll support":
      command => "ruby extconf.rb && make && make install",
      require => Exec["make install ${version}"],
      cwd => "/tmp/src/ruby-${version}/ext/openssl",
      unless => "which ruby"
    }

    package { "bundler":
      provider => "gem",
      ensure => "1.0.21",
      require => [ File["/root/.gemrc"], Exec["make install ${version}"]]
    }

    package { "rake":
      provider => "gem",
      require => Exec["make install ${version}"],
      ensure => "0.9.2.2"
    }
  }
  ruby_source{"ruby_source":
    require => Package["zlib1g-dev"]
  }

  package{"zlib1g-dev":
    ensure => present
  }
 
  file { "/root/.gemrc":
    content => template("ruby/gemrc"),
    require => Exec["ruby_code"],
    owner => root,
    group => root
  }
  
}
