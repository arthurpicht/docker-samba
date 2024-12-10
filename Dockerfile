FROM arthurpicht/debian-12:latest

ENV DOCKER_NAME="samba"

RUN set -uex; \
	export DEBIAN_FRONTEND=noninteractive; \
	apt-get -y update; \
	apt-get -y --no-install-recommends install samba; \
	apt-get -y clean; \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*; \
	mkdir /shares

EXPOSE 139 445

COPY scripts /usr/local/bin/

HEALTHCHECK CMD ["docker-healthcheck.sh"]
ENTRYPOINT ["entrypoint.sh"]

CMD [ "bash", "-c", "smbd -F -d 2 < /dev/null" ]







	
