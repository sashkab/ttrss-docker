# tt-rss in docker

[![Build Status](https://travis-ci.org/sashkab/ttrss-docker.svg?branch=master)](https://travis-ci.org/sashkab/ttrss-docker)

* nginx
* postges 9.6.x
* docker-compose

## Usage

Install docker, docker-compose, clone this repository and run

```sh
docker-compose up -d
```

Then access tt-rss on http://localhost:8080.

This is work-in-progress snapshot. Something works, something doesn't, and sometimes data will be lost. Use on your own risk. Report bugs and problems. I'm testing this on macOS using Docker 17.09. This might or might not work on older version of Docker and docker-compose.

## TODO

1. Enable SSL
1. Support for custom hostnames
1. Backup/restore jobs
