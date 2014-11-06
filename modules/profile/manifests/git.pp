#
class profile::git {
  include git

  git::config {'user.name':
    value => 'Marcus Campbell',
    user  => 'mcampbell',
  }
  git::config { 'user.email':
    value => 'marcus.anthony.campbell@gmail.com',
    user  => 'mcampbell',
  }
  git::config { 'push.default':
    value => 'simple',
    user  => 'mcampbell',
  }
  git::config { 'credential.helper':
    value => 'cache --timeout=3600',
    user  => 'mcampbell',
  }

}
