class wkhtmltopdf {

  package{
    "openssl":;
    "xorg":;
    "libssl-dev":;
  }

  wkhtmltopdf_source{"wkhtmltopdf_source":;}

  define wkhtmltopdf_source(
    $path = '/usr/local/src',
    $bin  = '/usr/local/bin'    
  ){
    exec { wkhtmltopdf_code:
      command => "wget http://wkhtmltopdf.googlecode.com/files/wkhtmltopdf-0.9.9-static-i386.tar.bz2 && tar -xvjf wkhtmltopdf-0.9.9-static-i386.tar.bz2",
      cwd => "${path}",
      creates => "${path}/wkhtmltopdf-i386"
    }
    file { "${path}/wkhtmltopdf-0.9.9-static-i386.tar.bz2":
      ensure => absent,
      require => Exec["wkhtmltopdf_code"]
    }
    file { "${bin}/wkhtmltopdf":
      ensure => "${path}/wkhtmltopdf-i386",
      require => Exec["wkhtmltopdf_code"]
    }
  } 
}
