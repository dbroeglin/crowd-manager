Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

class play($version = "2.1.1", $install_path = "/opt") {
  include wget

  $play_version = $version
  $play_path = "${install_path}/play-${play_version}"
  $download_url = "http://downloads.typesafe.com/play/${play_version}/play-${play_version}.zip"

  wget::fetch {"download-play-framework":
    source      => "$download_url",
    destination => "/opt/play-${play_version}.zip",
    timeout     => 0,
    require     => [ File[$install_path] ],
  } -> exec { "unzip-play-framework":
    cwd     => "${install_path}",
    command => "sudo -u vagrant /usr/bin/unzip ${install_path}/play-${play_version}.zip",
    unless  => "test -d $play_path",
    require => [ Package["unzip"] ],
  } -> file { "${install_path}/play":
    ensure => link,
    target => $play_path,
  } -> file { "$play_path/play":
    ensure  => file,
    owner   => "root",
    mode    => "0755",
  } -> file { "/usr/bin/play":
    ensure  => link,
    target  => "$play_path/play",
    require => File["$play_path/play"],
  }
}

class crowd($version = "2.6.2", $install_path = "/opt") {
  include wget
  include stdlib

  $crowd_version = $version
  $crowd_path    = "${install_path}/atlassian-crowd-${crowd_version}"
  $crowd_home    = "/var/opt/crowd-home"
  $download_url  = "http://www.atlassian.com/software/crowd/downloads/binary/atlassian-crowd-${crowd_version}.tar.gz"

  wget::fetch {"download-crowd-framework":
    source      => "$download_url",
    destination => "/opt/atlassian-crowd-${crowd_version}.tar.gz",
    timeout     => 0,
    require     => [ File[$install_path] ],
  } -> exec { "unzip-crowd-framework":
    cwd     => "${install_path}",
    command => "sudo -u vagrant tar zxvf ${install_path}/atlassian-crowd-${crowd_version}.tar.gz",
    unless  => "test -d $crowd_path",
  } -> file { $crowd_home:
    ensure  => directory,
    owner   => vagrant,
    group   => vagrant
  } -> file_line { "set_crowd_home_directory":
    path => "${crowd_path}/crowd-webapp/WEB-INF/classes/crowd-init.properties",
    line => "crowd.home=${crowd_home}"
  }
}

file { "/opt":
  ensure  => "directory",
  owner   => "vagrant",
  group   => "vagrant",
  mode    => 0755,
}

package { [
  "openjdk-7-jdk",
  "unzip",
  ]: ensure  => installed; 
}

include play
include crowd
