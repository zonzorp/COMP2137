class webserver {
  package { 'apache2': ensure => 'latest', }
  service { 'apache2':
    ensure => 'running',
    enable => true,
    require => Package['apache2'],
  }
}
class logserver {
  package { 'rsyslog': ensure => 'latest', }
  package { 'logwatch': ensure => 'latest', }
  service { 'rsyslog':
    ensure => 'running',
    enable => true,
    require => Package['rsyslog'],
  }
}
class linuxextras {
  package { 'sl' : ensure => "latest", }
  $mypackages = [ "cowsay", "fortune", "shellcheck", ]
  package { $mypackages : ensure => "latest", }
}
class hostips {
    host { 'hostvm' : ip => "LANNETNUM.1",}
    host { 'hostvm-mgmt' : ip => "MGMTNETNUM.1", host_aliases => 'puppet'}
    host { 'openwrt' : ip => "LANNETNUM.2",}
    host { 'openwrt-mgmt' : ip => "MGMTNETNUM.2", }
    host { 'PREFIX1' : ip => "LANIP",}
    host { 'PREFIX1-mgmt' : ip => "MGMTNETNUM.STARTINGHOSTNUM",}
    host { 'PREFIX2' : ip => "${vmintfnetnum}.((STARTINGHOSTNUM + 1 ))",}
    host { 'PREFIX2-mgmt' : ip => "MGMTNETNUM.((STARTINGHOSTNUM + 1))",}
}
