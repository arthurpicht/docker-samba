##  Repository

Dockerfile and related resources for a samba docker image
[arthurpicht/samba](https://hub.docker.com/r/arthurpicht/samba).

Forked from [servercontainer/samba](https://hub.docker.com/r/servercontainers/samba).

## Changes and additions

* Based on my [arthurpicht/debian-9](https://hub.docker.com/r/arthurpicht/debian-9) image.

* SMB from official APT repository instead of building from scratch

* no more `/shares` as volume, since all shares are meant to be mounted/bound to folders on host

* new envirionment variable `UID_ACCOUNT_username` to determine User-ID of configured samba user (see below).

## Environment variables and defaults

* ACCOUNT_username
 
    * multiple variables/accounts possible

    * adds a new user account with the given username and the env value as
      password to restrict access of volumes you can add the following to
      your samba volume config:

        valid users = joe; invalid users = hank;

* UID_ACCOUNT_username

    * optional

    * User-ID for account that is given with ACCOUNT_username

* SAMBA_CONF_WORKGROUP

    default: *WORKGROUP*

* SAMBA_CONF_SERVER_STRING

    default: *file server*

See docker hub page of [servercontainer/samba] for information about further
environment variables and configuration options.
