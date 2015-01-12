#
class hosts {

  $hosts = hiera_hash('hosts', undef)

  if $hosts { create_resources(Host, $hosts) }

}
