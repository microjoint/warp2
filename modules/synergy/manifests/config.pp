
class synergy::config inherits synergy {

  file {$config:
    ensure  => file,
    source  => $config_source,
  }
}
