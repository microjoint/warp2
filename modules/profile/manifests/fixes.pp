#
class profile::fixes
{
  #sort out the vim colors, when we clone it already has a 'colors' sub-directory
  exec{'move_vim_colors':
    path => ['/usr/bin'],
    cwd => '/usr/share/vim/addons/colors',
    command => 'rsync colors/ .'
    subscribe => Vcsrepo['/usr/share/vim/addons/colors'],

  }
}
