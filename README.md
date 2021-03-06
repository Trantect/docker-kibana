## Kibana Dockerfile

This repository contains a **Dockerfile** for the offical release of [Kibana](http://www.elasticsearch.org/overview/kibana/), which is currently version 4.1.0

### Base Docker Image

* [alpine:3.1](https://hub.docker.com/_/alpine/)

### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://hub.docker.com/r/trantect/docker-kibana/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `trantect/docker-kibana`

   (alternatively, you can build an image from the Dockerfile: `docker build -t="yours/docker-kibana" github.com/Trantect/docker-kibana`)

### Usage

To start a Kibana container, run:

`docker run -d -p 5601:5601 yours/docker-kibana`

Kibana needs to use the 1.4 version of elasticsearch.

To run the Kibana container with a linked version of elasticsearch 1.4, first run an elasticsearch Docker container named "elasticsearch".

Pull the dockerfile/elasticsearch image if you don't have the latest 1.4 version: `docker pull dockerfile/elasticsearch`

`docker run -d -p 9200:9200 -p 9300:9300 --name elasticsearch dockerfile/elasticsearch`

Then run a Kibana container with a link to the elasticsearch container:

`docker run -d -P --name kibana -p 5601:5601 --link elasticsearch:elasticsearch yours/docker-kibana`

After few seconds, open `http://<host>:5601` to see the result.
