#
class profile::user::root (
  $config = undef,
) {
  if $config {
    create_resources( file, $config )
  }
}
