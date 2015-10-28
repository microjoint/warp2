# Install of any git repos
class profile::repos
{

  $to_clone = hiera_hash(profile::repos::to_clone, undef)

  if $to_clone
  {
    $defaults = {
      ensure   => latest,
      provider => git,
    }
    create_resources( vcsrepo, $to_clone, $defaults )
  }

}
