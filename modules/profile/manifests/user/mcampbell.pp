#
class profile::user::mcampbell (
  $config = undef,
) {

  $defaults = {
    owner => 'mcampbell',
    group => 'mcampbell',
  }

  if $config {
    create_resources( file, $config, $defaults )
  }

}
