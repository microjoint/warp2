#
class profile::config::mcampbell (
  $config = undef,
) {
  if $config {
    create_resources( file, $config, $defaults )
  }
}
