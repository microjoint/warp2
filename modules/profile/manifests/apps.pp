#
class profile::apps inherits profile {
  #include profile::apps::passwordsafe
  include profile::apps::curl
  include profile::apps::tmux
  include profile::apps::awesome
}
