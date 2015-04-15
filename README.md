## postgresql9-ansible-role [![Build Status](https://travis-ci.org/alliedplatform/postgresql9-ansible-role.png)](https://travis-ci.org/alliedplatform/postgresql9-ansible-role)

Ansible role for installing and initializing a PostgreSQL 9.x cluster.

#### Supported Platforms

- Ubuntu 14.04 LTS (x86-64)

#### Requirements

- Python 2.7 (required to run Ansible)
- Ansible 1.9 or greater.

#### Role Dependencies

- [alliedplatform.security](https://github.com/alliedplatform/security-ansible-role)

#### Variables

##### Required variables

- `postgresql_version` - determines the version of PostgreSQL that will be installed. This can be set to `9.3` or `9.4`. The latest patch version (for example, 9.4.1 from a setting of `9.4`) will be installed.

##### Common variables

- `postgresql_encoding` - determines the encoding of the database template (via the `pg_createcluster` command) and the encoding of **all** databases created via this Ansible role (see the `postgresql_databases` variable). The default setting is `UTF-8`.
- `postgresql_locale` - determines the default locale for the database cluster and of **all** databases created via this Ansible role (see the `postgresql_databases` variable). The default setting is `en_US.UTF-8`.

- `postgresql_admin_role` - determines the name of the admin/superuser PostgreSQL role for the database cluster, the name of the operating system-level user/group that will own the PostreSQL process and the admin/superuser of **all** databases created via this Ansible role (see the `postgresql_databases` variable). The default setting is `postgres`.
- `postgresql_default_auth_method` - determines the authentication method that will be applied to every **default** permission in the `pg_hba.conf` file. The default setting is `trust`.

- `postgresql_cluster_name` - determines the name of the PostgreSQL cluster that will be created. The default setting is `main`.
- `postgresql_cluster_reset` - determines if an existing PostgreSQL cluster will be dropped and a new one created. The default setting is `false`.

- `postgresql_databases` - a list of YAML dictionaries describing the databases to be created in the database cluster. The `hstore` and `uuid_ossp` values determine if the hstore datatype module and module to generate universally unique identifiers should be enabled on the database, respectively.

Example:

```
postgresql_databases:
  - name: accounting_db
    hstore: yes
    uuid_ossp: yes
```

- `postgresql_roles` - a list of YAML dictionaries describing the roles (users) that will be created in the database cluster. These roles can be, in turn, assigned privileges to specific databases.

Example:

```
postgresql_roles:
  - name: adamjcook
    pass: Password1
```

- `postgresql_role_privileges` - a list of YAML dictionaries describing the database where the privileges and any role attributes will be granted.

Example:

```
postgresql_role_privileges:
  - role: adamjcook
    database: accounting_db
    privileges: "ALL"
    role_attr_flags: "CREATEDB"
```

##### Variable files

See the following Ansible variable files for more settings that can be configured during the provisioning process.

- `defaults/main.yml` - contains the defaults for all variables and the common variables for the `pg_hba.conf` file and `postgresql.conf` file between PostgreSQL versions 9.3 and 9.4.
- `vars/postgresql-9.3.yml` - contains the defaults for all `postgresql.conf` file settings **specific** to PostgreSQL version 9.3.
- `vars/postgresql-9.4.yml` - contains the defaults for all `postgresql.conf` file settings **specific** to PostgreSQL version 9.4.
- `vars/Ubuntu-14.04.yml` - contains the defaults for variables specific to PostgreSQL running on Ubuntu 14.04.
- `vars/Ubuntu.yml` - contains the defaults for variables specific to PostgreSQL running on Ubuntu (any version of Ubuntu).

#### Notes

Both PostgreSQL version 9.3 and PostgreSQL 9.4 are supported and tested by this role. When `vagrant up` is run in the repository root, two Vagrant VMs will be provisioned - one with a PostgreSQL 9.3 cluster and the other with a PostgreSQL 9.4 cluster. The automated Travis CI tests will also test PostgreSQL version 9.3 and PostreSQL version 9.4.

#### License

The content of this repository is licensed under the [The MIT License (MIT)](http://opensource.org/licenses/MIT).

Some of the testing infrastructure and Ansible plays are based from the work of Pieterjan Vandaele and others. Their work is also licensed under The MIT License and the license can be found [here](https://github.com/ANXS/postgresql/blob/master/LICENSE).
