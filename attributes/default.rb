default['modules']['default'] = {}
Chef::Log.info node.platform + " " + node.platform_version
default['modules']['init'] = value_for_platform_family(
  'centos' => {
    '<= 7.0' => 'upstart',
    '>= 7.0.0' => 'systemd'
  },
  'fedora' => {
    '>= 15' => 'systemd'
  },
  'default' => 'upstart')
default['modules']['packages'] = value_for_platform_family(
  'debian' => value_for_platform(
    'ubuntu' => {
      'default' => ['kmod'],
      ['10.04', '12.04', '12.10'] => ['module-init-tools'],
    },
    'default' => ['kmod']
  ),
  'centos' => {
    '<= 7.0' => ['module-init-tools'],
    '>= 7.0.0' => ['kmod']
  },
  'fedora' => {
    '>= 15' => ['kmod']
  },
  'default' => []
)
