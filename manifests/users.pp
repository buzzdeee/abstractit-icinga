# Class: icinga::users
#
# Setup users for Icinga
#

class icinga::users {
  $icinga_user    = $icinga::icinga_user
  $icinga_group   = $icinga::icinga_group
  $icinga_cmd_grp = $icinga::icinga_cmd_grp
  $spool_path     = $icinga::spool_path

  group { $icinga_cmd_grp:
    ensure => present,
    system => true,
  }
  group { $icinga_group:
    ensure => present,
    system => true,
  }
  user { $icinga_user:
    ensure     => present,
    groups     => [$icinga_group,$icinga_cmd_grp],
    system     => true,
    home       => $spool_path,
    managehome => false,
  }
}
