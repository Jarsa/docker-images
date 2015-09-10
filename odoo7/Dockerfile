FROM ubuntu:14.04
MAINTAINER Jesús Alan Ramos Rodríguez <alan.ramos@jarsa.com.mx>

# Fix locale
RUN	locale-gen fr_FR \
    && locale-gen en_US.UTF-8 \
    && dpkg-reconfigure locales \
    && update-locale LANG=en_US.UTF-8 \
    && update-locale LC_ALL=en_US.UTF-8 \
    && echo 'LANG="en_US.UTF-8"' > /etc/default/locale

# Install wget
RUN apt-get update && \
    apt-get install -y wget


# Add postgres
RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main' > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update

# Install dependencies
ADD files/dependencies /dependencies
RUN  apt-get install -y --allow-unauthenticated -q $(cat /dependencies) && \
	rm /dependencies

# Create Odoo user
RUN adduser --home=/opt/odoo --disabled-password --gecos "" --shell=/bin/bash odoo
RUN echo 'root:odoo' |chpasswd

# Add entrypoint file and give execute permission
ADD files/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Add volume
VOLUME /opt/odoo

# Add config file
ADD files/odoo-server.conf /opt/odoo/odoo-server.conf
RUN chown -R odoo:odoo /opt/odoo && chmod 640 /opt/odoo/odoo-server.conf

USER odoo
WORKDIR /opt/odoo
RUN git clone -b 7.0 --depth=1 --single-branch https://github.com/odoo/odoo.git 7.0 \
	&& git clone -b 7.0 --depth=1 --single-branch https://github.com/vauxoo/addons-vauxoo.git \
	&& git clone -b 7.0 --depth=1 --single-branch https://github.com/odoo-jarsa/odoo-mexico.git \
	&& mkdir argilsoft && cd argilsoft \
	&& bzr branch lp:~argilsoft/+junk/l10n_mx_facturae_pac_cd

CMD /entrypoint.sh

EXPOSE 8069
