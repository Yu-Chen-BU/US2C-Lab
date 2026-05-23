# Multi-architecture base image (works natively on Apple Silicon / arm64
# and on x86_64). Replaces the x86_64-only `jekyll/jekyll` image, which
# forced emulation and broke native gems such as mini_racer.
FROM ruby:3.3-slim

LABEL maintainer="I-SEC Lab"

# System dependencies required to build Jekyll and the al-folio plugins
# (native gem extensions, ImageMagick for jekyll-imagemagick, a JS runtime).
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        git \
        imagemagick \
        libmagickwand-dev \
        libffi-dev \
        libyaml-dev \
        pkg-config \
        nodejs \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /srv/jekyll

ADD Gemfile /srv/jekyll/
RUN bundle install
