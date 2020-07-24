# tt-rss in docker

* caddy2
* postges 12.2
* docker-compose
* php-fpm 7

## Usage

1. Install docker, docker-compose, clone this repository.
1. Update `rss/cofnig.php` with your hostname, email and other settings.
1. Update caddy/Caddyfile with your hostname and uncomment ssl-related settings.
1. Start docker-compose:

    ```sh
    docker-compose up -d && \
    sleep 5s && ./setup.sh && \
    docker-compose restart && \
    docker-compose logs -f
    ```

1. Access tt-rss on http://localhost, or on host you configured in steps above.

**WARNING**: This is work-in-progress snapshot. Something works, something doesn't, and sometimes data will be lost. Use on your own risk. Report bugs and problems.

## TODO

1. Restore jobs
1. Support for custom hostnames (currently it's done manually)
