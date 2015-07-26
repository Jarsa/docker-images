FROM vauxoo/odoo-80-image
MAINTAINER Jesús Alan Ramos Rodríguez <alan.ramos@jarsa.com.mx>

# Create Odoo user
RUN adduser --home=/opt/odoo --disabled-password --gecos "" --shell=/bin/bash odoo
RUN echo 'root:odoo' |chpasswd

# Add entrypoint file and give execute permission
ADD files/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Add config file
ADD files/odoo-server.conf /opt/odoo/odoo-server.conf
RUN chown -R odoo:odoo /opt/odoo && chmod 640 /opt/odoo/odoo-server.conf

# Clone Odoo and OML addons from Github
USER odoo
WORKDIR /opt/odoo
RUN git clone -b 7.0 --depth=1 --single-branch https://github.com/odoo/odoo.git 7.0 \
	&& git clone -b 7.0 --depth=1 --single-branch https://github.com/vauxoo/addons-vauxoo.git \
	&& git clone -b 7.0 --depth=1 --single-branch https://github.com/odoo-jarsa/odoo-mexico.git \
	&& mkdir argilsoft && cd argilsoft \
	&& bzr branch lp:~argilsoft/+junk/l10n_mx_facturae_pac_cd

CMD /entrypoint.sh

EXPOSE 8069
