#!/bin/bash
/opt/odoo/7.0/openerp-server \
-c /opt/odoo/odoo.conf \
--db_user=$DB_ENV_POSTGRES_USER \
--db_password=$DB_ENV_POSTGRES_PASSWORD \
--db_host=$DB_PORT_5432_TCP_ADDR \
--db-filter=^%h$ \
--proxy-mode

exec "$@"