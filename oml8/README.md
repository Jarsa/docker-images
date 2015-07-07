Odoo OML8
===========

This docker image is for Odoo 8.0 Mexico Localization.

In order to download this private docker you must login into dockerhub with::

    docker login

To run this image you must install docker[1] then run Postgres  docker image from::

    docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -e POSTGRES_USER=odoo -d postgres:latest

After the download process is completed you can run the container with::

    docker run --name some-odoo --link some-postgres:db -d alan196/oml8
