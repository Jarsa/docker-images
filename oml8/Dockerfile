FROM vauxoo/odoo-80-image
MAINTAINER Jesús Alan Ramos Rodríguez <alan.ramos@jarsa.com.mx>

# Create Odoo user
RUN adduser --home=/opt/odoo --disabled-password --gecos "" --shell=/bin/bash odoo
RUN echo 'root:odoo' |chpasswd

# Add entrypoint file and give execute permission
ADD files/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Clone Odoo and OML addons from Github
USER odoo
RUN /bin/bash -c "mkdir -p /opt/odoo/config"
WORKDIR /opt/odoo
RUN git clone -b 8.0 --single-branch https://github.com/odoo/odoo.git 8.0 \
	&& git clone -b 8.0 --single-branch https://github.com/vauxoo/addons-vauxoo \
	&& git clone -b 8.0 --single-branch https://508478c7dd9df622e61aeaf19e5cfe7dbeef4fb8:x-oauth-basic@github.com/vauxoo/odoo-mexico-v2.git

CMD /entrypoint.sh

EXPOSE 8069
