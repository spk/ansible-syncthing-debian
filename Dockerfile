FROM debian:stretch
MAINTAINER Laurent Arnoud <laurent@spkdev.net>

ENV ROLE_NAME ansible-syncthing-debian
ENV WORKDIR /build/${ROLE_NAME}
ENV PYTHONUNBUFFERED 1

WORKDIR ${WORKDIR}
RUN apt-get update -qq \
    && apt-get -y --no-install-recommends install ansible python-pip \
    && apt-get purge -y \
    && apt-get autoremove -y \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN pip install ansible-lint
ADD . ${WORKDIR}
ADD . /etc/ansible/roles/${ROLE_NAME}
ADD ./tests/inventory /etc/ansible/hosts

RUN ansible-playbook -i $WORKDIR/tests/inventory $WORKDIR/tests/test.yml --syntax-check
RUN ansible-lint $WORKDIR/tests/test.yml
RUN ansible-playbook -i $WORKDIR/tests/inventory $WORKDIR/tests/test.yml --connection=local
RUN ansible-playbook -i $WORKDIR/tests/inventory $WORKDIR/tests/test.yml --connection=local \
    | grep -q 'changed=0.*failed=0' \
    && (echo 'Idempotence test: pass' && exit 0) \
    || (echo 'Idempotence test: fail' && exit 1)
RUN syncthing -version
