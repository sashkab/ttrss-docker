# tt-rss in docker

* caddy
* postges 12.2
* docker-compose
* php-fpm 7

## Usage

1. Install docker, docker-compose, clone this repository and run.
1. Update `rss/cofnig.php` with your hostname, email and other settings.
1. Update caddy/Caddyfile with your hostname and uncomment ssl-related settings.

```sh
docker-compose build && \
docker-compose up -d && \
sleep 5s && ./setup.sh && \
docker-compose restart && \
docker-compose logs -f
```

Then access tt-rss on http://localhost.

This is work-in-progress snapshot. Something works, something doesn't, and sometimes data will be lost. Use on your own risk. Report bugs and problems. I'm testing this on macOS using Docker 19.03. This might or might not work on older version of Docker and docker-compose.

## TODO

1. Restore jobs
1. Support for custom hostnames (currently it's done manually)

### notes

```sh
docker-compose down && docker volume rm ttrssdocker_ttrss ttrssdocker_pgdata && docker-compose build && docker-compose up -d && sleep 5s && ./setup.sh && docker-compose restart && docker-compose logs -f
```
