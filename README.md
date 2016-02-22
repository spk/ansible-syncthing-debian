# Ansible Syncthing Debian

Provides Syncthing Debian packages from <http://apt.syncthing.net/>.

## Configurations

Default:

~~~ yaml
syncthing_version: "0.12.19"
syncthing_pin_priority: 600
syncthing_use_ufw: false
syncthing_apt_key_url: 'https://syncthing.net/release-key.txt'
syncthing_apt_repository_url: 'https://apt.syncthing.net/'
~~~

# Dependencies

None

# License

(c) 2016 Laurent Arnoud <laurent@spkdev.net>

BSD

---
[![Build](https://img.shields.io/travis-ci/spk/ansible-syncthing-debian.svg)](https://travis-ci.org/spk/ansible-syncthing-debian)
