FROM whyour/qinglong:latest
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN apk add chpasswd
RUN echo root:york618|chpasswd
EXPOSE 22
RUN apk add wget curl
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz
RUN tar xvzf ~/ngrok-stable-linux-amd64.tgz -C /usr/local/bin
RUN ngrok auth ${{ TOKEN }}
RUN setsid ngrok tcp 22
