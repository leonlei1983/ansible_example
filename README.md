# ansible_example

### file structure

```
├── README.md
├── ansible.cfg
├── filter_plugins
├── inventories
│   ├── group_vars
│   │   ├── all.yml
│   │   ├── demo
│   │   │   ├── vars.yml
│   │   │   └── vault.yml
│   │   └── demo2
│   │       └── vars.yml
│   ├── host_vars
│   ├── develop
│   ├── staging
│   └── production
├── library
├── module_utils
├── playbooks
│   ├── demo.yml
│   └── demo2.yml
└── roles
```
reference:
- https://docs.ansible.com/ansible/2.6/user_guide/playbooks_best_practices.html

### ansible.cfg

reference:
- https://raw.githubusercontent.com/ansible/ansible/devel/examples/ansible.cfg


### inventory

list all hosts from the specific inventory file
```sh
ansible-inventory -i inventories/staging --vault-password-file=<vault password file> --list
```

### vault variable

encryption
```sh
ansible-vault encrypt --ask-vault-pass <variable file>
ansible-vault encrypt --vault-password-file=<vault password file> <variable file>
```

decryption
```sh
ansible-vault decrypt --ask-vault-pass <variable file>
ansible-vault encrypt --vault-password-file=<vault password file> <variable file>
```

### role

download 3rd party role from galaxy
```sh
ansible-galaxy install <3rd party role>
```

reference:
- https://galaxy.ansible.com/home

create a custom role
```sh
ansible-galaxy init roles/<custom role>
```

### playbook

execute with vault variables
```sh
ansible-playbook -i inventories/staging playbooks/demo.yml --vault-password-file=<vault password file>
```

execute without vault variables
```sh
ansible-playbook -i inventories/staging playbooks/demo2.yml
```
