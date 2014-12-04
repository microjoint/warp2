#
class profile::user::mcampbell (
  $config = undef,
) {

  if $config {
    create_resources( file, $config )
  }

}
