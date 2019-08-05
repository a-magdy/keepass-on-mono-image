FROM mono:6.0.0.313

ARG KEEPASS_DOWNLOAD_URL
ENV KEEPASS_DOWNLOAD_URL ${KEEPASS_DOWNLOAD_URL:-"https://sourceforge.net/projects/keepass/files/KeePass%202.x/2.42.1/KeePass-2.42.1.zip"}

ADD ./binaries/unzip_6.0-16+deb8u5_amd64.deb /tmp/unzip.deb
RUN dpkg -i /tmp/unzip.deb

RUN curl -L -o /tmp/KeePass.zip "$KEEPASS_DOWNLOAD_URL" && \
    unzip /tmp/KeePass.zip -d /KeePass && \
    rm -f /tmp/*

ADD ./config/KeePass.config.xml /KeePass/

ADD ./scripts /scripts

RUN sh /scripts/update-config.sh

ENTRYPOINT [ "/scripts/entrypoint.sh" ]
