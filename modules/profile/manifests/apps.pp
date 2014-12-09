#
class profile::apps
{

  $to_install = hiera_hash(profile::apps::to_install, undef)

  #include profile::apps::passwordsafe
  include profile::apps::awesome

  if $to_install
  {
    create_resources( package, $to_install )
  }

}
