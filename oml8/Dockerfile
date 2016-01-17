FROM jarsa/odoo-image:8.0
MAINTAINER Jesús Alan Ramos Rodríguez <alan.ramos@jarsa.com.mx>

# Create Odoo user
RUN adduser --home=/opt/odoo --disabled-password --gecos "" --shell=/bin/bash odoo
RUN echo 'root:odoo' |chpasswd

# Add entrypoint file and give execute permission
ADD files/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Add filestorage folder
RUN /bin/bash -c "mkdir -p /home/odoo"
RUN chown odoo /home/odoo

VOLUME /opt/odoo

RUN echo $'#!/bin/bash\nchown -R odoo:odoo /opt/odoo && chmod 640 /opt/odoo/odoo-server.conf' > /permission.sh && chmod +x permission.sh
CMD /permission.sh

USER odoo
CMD /entrypoint.sh

EXPOSE 8069
EXPOSE 8072