#!/bin/bash
/opt/odoo/8.0/odoo.py \
--addons-path=/opt/odoo/8.0/addons,/opt/odoo/addons-vauxoo,/opt/odoo/odoo-mexico-v2 \
--db_user=$DB_ENV_POSTGRES_USER \
--db_password=$DB_ENV_POSTGRES_PASSWORD \
--db_host=$DB_PORT_5432_TCP_ADDR

exec "$@"