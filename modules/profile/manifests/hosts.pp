# Create the host file
class profile::hosts
{

  $hosts = hiera_hash('hosts', undef)

  if $hosts { create_resources(Host, $hosts) }

}
