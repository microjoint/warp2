#
class profile::pc (
  $symlinks = {}
  ) inherits profile {

  # include dropbox
  # setup symlinks
  create_resources( file, $symlinks )

}
