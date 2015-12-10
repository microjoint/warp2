---
users:
  'root':
    config:
      '/var/spool/cron/crontabs/root':
        ensure: file
        mode: '0600'
        source: 'puppet:///modules/profile/root/cron-WHOD5000370'
