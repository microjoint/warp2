# This is for a desktop PC that we'd have a GUI interface
class profile::desktop(
  $xrandr = hiera('xrandr', nil)
){

  include pdnsd

  # Let's have some ponysay
  vcsrepo { '/usr/local/bin/ponysay':
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/erkin/ponysay.git',
    notify   => Exec['install_ponysay'],
  }

  exec { 'install_ponysay':
    command     => 'python3 setup.py --freedom=partial --without-info install',
    path        => ['/usr/bin','/bin/'],
    cwd         => ['/usr/local/bin/ponysay'],
    refreshonly => true,
    #user       => 'root',
    #subscribe  => Vcsrepo['/usr/local/bin/ponysay'],
  }

}
