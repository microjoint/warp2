#
class profile::user::mcampbell
{

  $config = hiera_hash(profile::user::mcampbell::config)

  $defaults = {
    owner => 'mcampbell',
    group => 'mcampbell',
  }

  create_resources( file, $config, $defaults )

}
