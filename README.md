andrewrothstein.operator_sdk
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-operator_sdk.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-operator_sdk)

Installs the [operator-sdk](https://coreos.com/operators/)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.operator_sdk
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
