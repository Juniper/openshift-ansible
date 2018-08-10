FROM alpine:3.6
MAINTAINER Juniper Networks
RUN echo "===> Installing sudo to emulate normal OS behavior..."  && \
    apk --update add sudo                                         && \
    \
    apk --update add python py-pip openssl ca-certificates jq bash && \
    apk --update add --virtual build-dependencies \
                python-dev libffi-dev openssl-dev build-base && \
    apk --update add sshpass openssh-client rsync git && \
    pip install --upgrade pip cffi boto boto3 ansible==2.5.2.0 && \
    \
    echo "===> Removing package list..."  && \
    apk del build-dependencies            && \
    rm -rf /var/cache/apk/*               && \
    \
    \
    echo "===> Adding hosts for convenience..."  && \
    mkdir -p /etc/ansible                        && \
    echo 'localhost' > /etc/ansible/hosts        && \
    \
    git clone https://github.com/Juniper/openshift-ansible -b release-3.7-contrail /root/openshift-ansible3.7
