FROM node:12-buster

RUN set -e; \
    apt update; \
    apt install -y gettext; \
    rm -rf /var/lib/apt/lists/*

ARG branch=master

ENV NODE_ENV production
WORKDIR /opt/magic_mirror

RUN git clone --depth 1 -b ${branch} https://github.com/MichMich/MagicMirror.git .
# RUN cp -R modules /opt/default_modules
# RUN cp -R config /opt/default_config

# My code
RUN git clone --depth 1 -b ${branch} https://github.com/David-Greco/MyMagicMirror.git .
RUN cp -R clock /opt/default_modules
RUN cp -R compliments /opt/default_modules
RUN cp config.js /home/dgreco/magic_mirror/config
# My code

RUN npm install --unsafe-perm --silent

COPY mm-docker-config.js docker-entrypoint.sh ./
RUN chmod +x ./docker-entrypoint.sh

EXPOSE 8080
ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["node", "serveronly"]
