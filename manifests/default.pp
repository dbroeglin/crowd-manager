Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

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

  $crowd_version = $version
  $crowd_path    = "${install_path}/crowd-${crowd_version}"
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
  }
}

include play
include crowd