class apache-install {
  notify { "Starting the Apache Installation and Configuration": }
  case $::operatingsystem{
    'Ubuntu': {
      package {'apache2':
        ensure => present,
      } ->
      file {'/etc/apache2/apache2.conf':
        ensure => file,
      } ~>
      service {'apache2':
        ensure => running,
        require => Package['apache2']
      }
    }
    'RedHat': {
      package {'httpd':
        ensure => present,
      } ->
      file {'/etc/httpd/httpd.conf':
        ensure => file,
      } ~>
      service {'httpd':
       ensure => running,
       require => Package['httpd']
      }
    }
    default: {
      notify {'The Operating System is not Defined in the script':}
    }
  }
}
