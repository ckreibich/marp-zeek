# A template for Zeeky markdown-based slidedecks

This is an experimental template for slidedecks generated via [Marp](https://marp.app/).
It enables simple markdown-based slides that feature out-of-the-box syntax
highlighting.

## Installation

Start by installing the Marp CLI via NPM:

```console
$ npm i -g @marp-team/marp-cli @marp-team/marp-core highlight.js
```

You should now have a `marp` executable:

```console
$ marp --version
@marp-team/marp-cli v4.5.1 (w/ @marp-team/marp-core v4.4.0)
```

## Generating slides

This repo contains a minor modification (see `marp/engine.js`) that hooks Zeek
syntax highlighting into the slide generation.

From the local directory, generate HTML by running

```console
$ marp --engine marp/engine.js --theme ./zeek.css slides.md -o docs/index.html
```

This repo provides a wrapper, `./marp-zeek.sh`, that uses the adapted engine and
a Zeek stylesheet. You can invoke from anywhere and just provide your slides and
output location. For example:

```console
$ /path/to/marp-zeek.sh myslides.md -o myslides.html
```

## Dockerfile

The repo also includes a Dockerfile based on `node:lts-slim` that builds
everything for you. It drops you into /home/node, as user "node", and has
`marp-zeek.sh` in its PATH.

```console
$ docker build -t marp-zeek .
$ docker run -it --rm -v $PWD:/home/node marp-zeek:latest
node@aeba08ba5ba2:~$ marp-zeek.sh my-slides.md -o my-slides.html
[  INFO ] Converting 1 markdown...
[  INFO ] my-slides.md => my-slides.html
node@aeba08ba5ba2:~$ <ctrl-d>
$ ls my-slides.html
my-slides.html
```

## Supported output formats

HTML and PDF are looking great. The Powerpoint output is, as of now, unusable.
