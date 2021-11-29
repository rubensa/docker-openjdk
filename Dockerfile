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