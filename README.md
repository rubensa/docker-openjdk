# Docker image based on OpenJDK with fontconfig

This is a Docker image based on [OpenJDK](https://hub.docker.com/_/openjdk) with [fontconfig](https://www.freedesktop.org/wiki/Software/fontconfig/) pre-installed.

For applications requiring the use of Graphics, e.g Jasper Reports, fontconfig can't find any fonts in the java:8-jre-alpine image because there are no fonts. The Debian-based image has just enough fonts to support the default JDK fonts. These fonts come from the fonts-dejavu-core package, which is a transitive dependency of libfontconfig1 on Debian. The solution is to install the ttf-dejavu package in java:8-jre-alpine image.

This docker image was created following the instructions on https://github.com/docker-library/openjdk/issues/73

## Dockerfile

```
FROM openjdk:8-jre-alpine
LABEL author="Ruben Suarez <rubensa@gmail.com>"

# Needed to fix 'Fontconfig warning: ignoring C.UTF-8: not a valid language tag'
ENV LANG en_GB.UTF-8

# Configure apk and install packages
# JRE fails to load fonts if there are no standard fonts in the image; DejaVu is a good choice,
# see https://github.com/docker-library/openjdk/issues/73#issuecomment-207816707
RUN apk add --update ttf-dejavu \
    #
    # Clean up
    && rm -rf /var/cache/apk/*
```
