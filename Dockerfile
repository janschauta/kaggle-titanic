FROM kaggle/python:latest

RUN apt-get update && apt-get upgrade -y --force-yes && \
    apt-get install -y vim sudo dialog adduser libxtst6

# Install git 1.9.1.
RUN echo "deb http://cloudfront.debian.net/debian wheezy-backports main" >> /etc/apt/sources.list && \
    echo "deb-src http://cloudfront.debian.net/debian wheezy-backports main" >> /etc/apt/sources.list && \
    apt-get update && apt-get install -y --force-yes git && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create user to enable x forwarding.
ENV USER='user'
RUN adduser --disabled-password --gecos '' $USER && \
    usermod -s /bin/bash $USER && \
    usermod -aG sudo $USER && \
    # Set the same password as username.
    echo $USER:$USER | chpasswd && \
    echo 'root:root' | chpasswd

# Login as user.
USER $USER
ENV HOME=/home/$USER
WORKDIR /home/$USER

CMD bash
