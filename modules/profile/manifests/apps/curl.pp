#
class profile::apps::curl {
  package{'curl': ensure => present}
}
