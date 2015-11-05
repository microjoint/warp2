#
class profile::git (
    $git_config = hiera_hash('git_config')
) {
  include git

  create_resources(git::config, $git_config)

  #git::config {'user.name':
  #  value   => 'Marcus Campbell',
  #  user    => 'mcampbell',
  #}
  #git::config { 'user.email':
  #  value => 'marcus.anthony.campbell@gmail.com',
  #  user  => 'mcampbell',
  #}
  #git::config { 'push.default':
  #  value => 'simple',
  #  user  => 'mcampbell',
  #}
  #git::config { 'credential.helper':
  #  value => $cache_timeout,
  #  user  => 'mcampbell',
  #}

}
