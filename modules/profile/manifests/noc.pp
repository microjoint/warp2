# This is for a NOC pc
class profile::noc(
  $xrandr = hiera('xrandr', nil) # command to customise screens
){

  include lightdm
  include pdnsd

}
