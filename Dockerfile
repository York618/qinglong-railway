FROM whyour/qinglong:latest
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:york618|chpasswd
EXPOSE 22
RUN apk add wget curl
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz
RUN tar xvzf ~/ngrok-stable-linux-amd64.tgz -C /usr/local/bin
RUN ngrok auth ${{ TOKEN }}
RUN setsid ngrok tcp 22

ARG QL_MAINTAINER="whyour"
LABEL maintainer="${QL_MAINTAINER}"
ARG QL_URL=https://github.com/${QL_MAINTAINER}/qinglong.git
ARG QL_BRANCH=master

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LANG=zh_CN.UTF-8 \
    SHELL=/bin/bash \
    PS1="\u@\h:\w \$ " \
    QL_DIR=/ql \
    QL_BRANCH=${QL_BRANCH}

WORKDIR ${QL_DIR}

RUN git clone -b ${QL_BRANCH} ${QL_URL} ${QL_DIR} \
    && cd ${QL_DIR} \
    && cp -f .env.example .env \
    && chmod 777 ${QL_DIR}/shell/*.sh \
    && chmod 777 ${QL_DIR}/docker/*.sh \
    && cp -rf /node_modules ./ \
    && rm -rf /node_modules \
    && pnpm install --prod \
    && rm -rf /root/.pnpm-store \
    && rm -rf /root/.cache \
    && git clone -b ${QL_BRANCH} https://github.com/${QL_MAINTAINER}/qinglong-static.git /static \
    && cp -rf /static/* ${QL_DIR} \
    && rm -rf /static
ENTRYPOINT ["./docker/docker-entrypoint.sh"]
