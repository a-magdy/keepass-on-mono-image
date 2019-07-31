FROM mono:6.0.0.313

ADD ./binaries/KeePass-2.42.1.tar.gz /

ADD ./config/KeePass.config.xml /KeePass-2.42.1/

ADD ./scripts /scripts

RUN sh /scripts/update-config.sh

ENTRYPOINT [ "/scripts/entrypoint.sh" ]
