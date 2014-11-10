#
class xscreensaver::config inherits xscreensaver {

  if $config {
    create_resources( file, $config )
  }
}
