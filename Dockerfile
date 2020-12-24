FROM centos:7

# Install the needed packages
RUN yum -y install epel-release
RUN yum -y install docker ansible openssh-server openssh-clients curl
RUN curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /bin/docker-compose

# Add SSH configuration
ADD entrypoint.sh /bin/entrypoint.sh
RUN chmod 755 /bin/docker-compose; \ 
    chmod 755 /bin/entrypoint.sh

# Start with bash script
ENTRYPOINT /bin/entrypoint.sh && /bin/bash 

