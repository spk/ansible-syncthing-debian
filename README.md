# Ansible Syncthing Debian

Provides Syncthing Debian packages from <http://apt.syncthing.net/>.

## Configurations

Default:

~~~ yaml
syncthing_version: "0.13.10"
syncthing_pin_priority: 600
syncthing_use_ufw: false
syncthing_apt_key_url: 'https://syncthing.net/release-key.txt'
syncthing_apt_repository_url: 'https://apt.syncthing.net/'

syncthing_system_user: syncthing
syncthing_system_group: syncthing
syncthing_system_user_home: "/home/{{ syncthing_system_user }}"
syncthing_system_syncthing_home: "/home/{{ syncthing_system_user }}/.config/syncthing"

syncthing_folders:
  - id: default
    label: Default
    path: "/home/{{ syncthing_system_user }}/Sync"
    shared_with_groups: []

syncthing_net_hosts: []
syncthing_net_groups: []

syncthing_gui_enable: false
syncthing_gui_enable_tls: true
syncthing_gui_host: 127.0.0.1
syncthing_gui_port: 8384
~~~

# Dependencies

None

# License

(c) 2016 Laurent Arnoud <laurent@spkdev.net>

BSD

---
[![Build](https://img.shields.io/travis-ci/spk/ansible-syncthing-debian.svg)](https://travis-ci.org/spk/ansible-syncthing-debian)
