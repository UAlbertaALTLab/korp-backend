# For korp-backend
FROM python:3.6-slim-buster

LABEL maintainer="szhao5@ualberta.ca"


RUN apt-get update \
    # https://github.com/spraakbanken/korp-backend
	&& apt-get install subversion git default-libmysqlclient-dev -y \
	&& svn co http://svn.code.sf.net/p/cwb/code/cwb/trunk cwb \
	&& cd cwb \
	&& ./install-scripts/install-linux \
	&& mkdir -p /corpora/data \
	&& mkdir -p /corpora/registry \
	&& cd / \
	&& git clone https://github.com/UAlbertaALTLab/korp-backend.git \
	&& cd korp-backend \
	&& pip3 install -r requirements.txt
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
CMD /bin/bash

