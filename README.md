##  Repository

Dockerfile and related resources for samba docker image
[arthurpicht/samba](https://hub.docker.com/r/arthurpicht/samba).

Forked from [servercontainer/samba](https://hub.docker.com/r/servercontainers/samba).

## Changes and additions

* Based on my [arthurpicht/debian-11](https://hub.docker.com/r/arthurpicht/debian-11) image.

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

See docker hub page of [servercontainer/samba](https://hub.docker.com/r/servercontainers/samba) for information about further
environment variables and configuration options.

## Example docker call

```
docker run \
        -d \
        --rm \
        --name samba \
        -e ACCOUNT_smbuser=geheim \
        -e UID_ACCOUNT_smbuser=1001 \
        -e SAMBA_VOLUME_CONFIG_TEST="[test]; path=/shares/test; guest ok = no; read only = no; browsable = yes" \
        --mount type=bind,source=/on/host/samba,target=/shares/test \
        -p 139:139 \
        -p 445:445 \
        arthurpicht/samba
```

Target folder on host `/on/host/samba` needs file permissions for User-Id `1001` specified by UID_ACCOUNT_smbuser.
