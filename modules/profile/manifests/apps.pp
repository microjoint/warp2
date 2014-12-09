#
class profile::apps
{

  $to_install = hiera_hash(profile::apps::to_install, undef)

  if $to_install
  {
    create_resources( package, $to_install )
  }

}
