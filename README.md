# Mkdocs-Material

This repo contains a `Dockerfile` to build
[Docker](https://www.docker.com) image for adding two plugins to the
[squidfunk/mkdocs-material]() container image:
* [plantuml-markdown](https://github.com/mikitex70/plantuml-markdown)
* [pheasant](https://pheasant.daizutabi.net/)

## Usage

To instantiate an ephemeral container from the image, mount the current
directory within the container, and open a bash prompt within the `base` conda
Python environment:

```bash
docker run -it --rm -p 8000:8000 -v ${PWD}:/docs blueogive/mkdocs-material:latest
```

By default, the container will assume your website content is in `${PWD}/docs`
and your `mkdocs.yml` is in `${PWD}`. Once instantiated it will attempt to build
and server your site on [http://locahost:8000](http://locahost:8000).

Contributions are welcome.
