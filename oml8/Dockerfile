FROM vauxoo/odoo-80-image
MAINTAINER Jesús Alan Ramos Rodríguez <alan.ramos@jarsa.com.mx>

# Create Odoo user
RUN adduser --home=/opt/odoo --disabled-password --gecos "" --shell=/bin/bash odoo
RUN echo 'root:odoo' |chpasswd

# Clone Odoo from Github
USER odoo
RUN /bin/bash -c "mkdir -p /opt/odoo/config"
WORKDIR /opt/odoo
RUN git clone -b 8.0 --single-branch https://github.com/odoo/odoo.git 8.0 \
	&& git clone -b 8.0 --single-branch https://github.com/vauxoo/addons-vauxoo \
	&& git clone -b 8.0 --single-branch https://508478c7dd9df622e61aeaf19e5cfe7dbeef4fb8:x-oauth-basic@github.com/vauxoo/odoo-mexico-v2.git

ADD files/entrypoint.sh /entrypoint.sh
USER root
RUN chmod +x /entrypoint.sh

USER odoo

#WORKDIR /opt/odoo/8.0
#CMD ["/opt/odoo/8.0/odoo.py","--addons-path=/opt/odoo/8.0/addons,/opt/odoo/addons-vauxoo,/opt/odoo/odoo-mexico-v2","--db_user=$DB_ENV_POSTGRES_USER","--db_password=$DB_ENV_POSTGRES_PASSWORD","--db_host=$DB_PORT_5432_TCP_ADDR"]
# RUN ./odoo.py -c /opt/odoo/config/odoo.conf

CMD /entrypoint.sh

EXPOSE 8069
