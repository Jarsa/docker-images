FROM vauxoo/odoo-80-image
MAINTAINER Jesús Alan Ramos Rodríguez <alan.ramos@jarsa.com.mx>

# Create Odoo user
RUN adduser --home=/opt/odoo --disabled-password --gecos "" --shell=/bin/bash odoo
RUN echo 'root:odoo' |chpasswd

# Clone Odoo from Github
USER odoo
RUN /bin/bash -c "mkdir -p /opt/odoo/config"
RUN cd /opt/odoo \
	&& git clone -b 8.0 --single-branch https://github.com/odoo/odoo.git 8.0 \
	&& git clone -b 8.0 --single-branch https://github.com/vauxoo/addons-vauxoo \
	&& git clone -b 8.0 --single-branch https://github.com/vauxoo/odoo-mexico-v2

ADD files/odoo.conf /opt/odoo/config/

EXPOSE 8069