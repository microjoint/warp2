#
class profile::apps
{

  $packages = hiera_hash(profile::apps::to_install, undef)

  if $packages
  {
    create_resources( package, $packages )
  }

}
