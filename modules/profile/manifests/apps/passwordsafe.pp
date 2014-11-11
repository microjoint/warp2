#
class profile::apps::passwordsafe {
  package{'passwordsafe': ensure => present }
  # file{'/home/mcampbell/.??':
  #   ensure => file,
  #   source => 'puppet:///modules/pc/passwordsafe??'
  # }
}
