# Set the timezone
class profile::timezone
{

  $timezone = hiera('profile::timezone')

  file{ '/etc/timezone':
    ensure  => file,
    content => "${timezone}\n",
  }

}
