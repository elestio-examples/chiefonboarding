<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# ChiefOnboarding, verified and packaged by Elestio

[ChiefOnboarding](https://chiefonboarding.com/) help you structure your onboarding process for IT, HR, managers, buddies, and, of course, your new hires.

<img src="https://raw.githubusercontent.com/elestio-examples/chiefonboarding/main/chiefonboarding.png" alt="chiefonboarding" width="800">

[![deploy](https://github.com/elestio-examples/chiefonboarding/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/chiefonboarding)

Deploy a <a target="_blank" href="https://elest.io/open-source/chiefonboarding">fully managed ChiefOnboarding</a> on <a target="_blank" href="https://elest.io/">elest.io</a> if you want automated backups, reverse proxy with SSL termination, firewall, automated OS & Software updates, and a team of Linux experts and open source enthusiasts to ensure your services are always safe, and functional.

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- Our team performs quality control checks to ensure the products we release meet our high standards.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/elestio-examples/chiefonboarding.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env

Edit the .env file with your own values.

Create data folders with correct permissions

    mkdir -p ./data
    chown -R 1000:1000 ./data

Run the project with the following command

    docker-compose up -d

You can access the Web UI at: `http://your-domain:8888`

## Docker-compose

Here are some example snippets to help you get started creating a container.

    version: "3.3"

    services:
    db:
        image: postgres:14
        restart: always
        volumes:
          - ./data:/var/lib/postgresql/data
        environment:
          - POSTGRES_DB=chiefonboarding
          - POSTGRES_USER=postgres
          - POSTGRES_PASSWORD=postgres

    app:
        image: elestio4test/chiefonboarding:latest
        restart: always
        ports:
          - "172.17.0.1:8888:8000"
        environment:
          - SECRET_KEY=${SECRET_KEY}
          - DATABASE_URL=postgres://postgres:postgres@db:5432/chiefonboarding
          - ALLOWED_HOSTS=${DOMAIN}
          - ACCOUNT_EMAIL=${ADMIN_EMAIL}
          - ACCOUNT_PASSWORD=${ADMIN_PASSWORD}
          - ANYMAIL=${ANYMAIL}
          - DEFAULT_FROM_EMAIL=${DEFAULT_FROM_EMAIL}
          - EMAIL_HOST=${EMAIL_HOST}
          - EMAIL_PORT=${EMAIL_PORT}
          - EMAIL_HOST_USER=${EMAIL_HOST_USER}
          - EMAIL_HOST_PASSWORD=${EMAIL_HOST_PASSWORD}
          - EMAIL_USE_TLS=${EMAIL_USE_TLS}
          - EMAIL_USE_SSL=${EMAIL_USE_SSL}
        depends_on:
          - db

### Environment variables

|      Variable      |   Value (example)    |
| :----------------: | :------------------: |
|     SECRET_KEY     |       xxx-xxxx       |
|       DOMAIN       |     your.domain      |
|    ADMIN_EMAIL     |    admin@mail.com    |
|   ADMIN_PASSWORD   |    xxxx-xxxx-xxxx    |
|      ANYMAIL       |         True         |
| DEFAULT_FROM_EMAIL | admin@vm.elestio.app |
|     EMAIL_HOST     |      172.17.0.1      |
|     EMAIL_PORT     |          25          |
|   EMAIL_USE_TLS    |        False         |
|   EMAIL_USE_SSL    |        False         |

# Maintenance

## Logging

The Elestio ChiefOnboarding Docker image sends the container logs to stdout. To view the logs, you can use the following command:

    docker-compose logs -f

To stop the stack you can use the following command:

    docker-compose down

## Backup and Restore with Docker Compose

To make backup and restore operations easier, we are using folder volume mounts. You can simply stop your stack with docker-compose down, then backup all the files and subfolders in the folder near the docker-compose.yml file.

Creating a ZIP Archive
For example, if you want to create a ZIP archive, navigate to the folder where you have your docker-compose.yml file and use this command:

    zip -r myarchive.zip .

Restoring from ZIP Archive
To restore from a ZIP archive, unzip the archive into the original folder using the following command:

    unzip myarchive.zip -d /path/to/original/folder

Starting Your Stack
Once your backup is complete, you can start your stack again with the following command:

    docker-compose up -d

That's it! With these simple steps, you can easily backup and restore your data volumes using Docker Compose.

# Links

- <a target="_blank" href="https://docs.chiefonboarding.com/">ChiefOnboarding documentation</a>

- <a target="_blank" href="https://github.com/chiefonboarding/ChiefOnboarding">ChiefOnboarding Github repository</a>

- <a target="_blank" href="https://github.com/elestio-examples/chiefonboarding">Elestio/chiefonboarding Github repository</a>
