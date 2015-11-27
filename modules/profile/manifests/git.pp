#
class profile::git (
    $git_config = hiera_hash('git_config')
) {
  include git

  if $git_config {
    notice($git_config)
    create_resources(git::config, $git_config)
  }
}
