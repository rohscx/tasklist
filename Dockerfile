FROM ubuntu:latest
MAINTAINER RoHscx

# 80 = HTTP, 443 = HTTPS, 3000 = Node.js server
EXPOSE 80 443 3000

# Install Utilities
RUN apt-get update -q  \
 && apt-get install -yqq \
 curl \
 git \
 sudo \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create a user & switch to the users DIR
RUN adduser meteor
RUN su - user -c "touch me"

# Install Meteor
RUN su - user -c "curl https://install.meteor.com/ | sh"
WORKDIR ~/

CMD ["su", "-", "user", "-c", "/bin/bash"]
