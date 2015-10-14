# This is for a desktop PC that we'd have a GUI interface
class profile::desktop(
  $xrandr = hiera('xrandr', nil)
){

  include pdnsd

}
