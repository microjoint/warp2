#
class profile::work inherits profile {

  $packages = hiera_hash(profile::apps::to_install, undef, 'work')

  if $packages
  {
    create_resources( package, $packages )
  }

}
