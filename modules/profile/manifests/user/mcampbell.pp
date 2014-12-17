#
class profile::user::mcampbell
{

  $config = hiera_hash(profile::user::mcampbell::config)

  $defaults = {
    owner => 'mcampbell',
    group => 'mcampbell',
  }

  create_resources( file, $config, $defaults )

  file { '/home/mcampbell/.csshrc':
    ensure  => file,
    content => template('profile/csshrc.erb'),
  }
  file { '/home/mcampbell/.xinitrc':
    ensure  => file,
    content => template('profile/xinitrc.erb')
  }

}
