# For korp-backend
FROM python:3.7-slim-buster

LABEL maintainer="szhao5@ualberta.ca"


RUN apt-get update \
	&& apt-get install subversion -y \
	&& svn co http://svn.code.sf.net/p/cwb/code/cwb/trunk cwb \
	&& cd cwb \
	&& ./install-scripts/install-linux
## Install Apache2 and other stuff needed to access svn via WebDav
#RUN apk add --no-cache apache2 apache2-utils apache2-webdav mod_dav_svn &&\
## Install svn
#apk add --no-cache subversion &&\

# Add our python app code to the image
# RUN mkdir -p /corpora/data
# ADD . /corpora
# RUN mkdir -p /corpora/registry
# ADD . /corpora

# WORKDIR /app

# Set the default command to execute
# COPY cmd.sh /cmd.sh
# RUN chmod +x /cmd.sh
CMD sh

