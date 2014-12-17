#
class profile::pc inherits profile {

  $packages = hiera_hash(profile::apps::to_install, undef, 'pc')

  if $packages
  {
    create_resources( package, $packages )
  }

}
