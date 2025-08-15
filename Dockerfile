FROM neo4j:5.25

RUN apt update \
 && apt install -y xz-utils

# setup dir
RUN mkdir -p /conf /plugins

# setup files
COPY neo4j.conf /conf/
COPY plugins/* /plugins/

# set to default neo4j user:group and copy apoc version to plugins dir for use
RUN chmod 640 /conf/neo4j.conf \
 && chown 7474:7474 /conf/neo4j.conf \
 && xz -d /plugins/*.jar.xz \
 && cp -f /var/lib/neo4j/labs/* /plugins/ \
 && chmod 777 /plugins/*
