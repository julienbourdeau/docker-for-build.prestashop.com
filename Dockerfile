FROM ruby:2.1
MAINTAINER julien@sigerr.org

RUN apt-get update \
  && apt-get install -y \
    sudo \
    nodejs npm \
    python-pygments \
  && apt-get clean


WORKDIR /src
RUN gem install bundler
RUN gem install json github-pages jekyll-gist
RUN npm install -g bower

VOLUME /src
EXPOSE 4000

RUN ln -s /usr/bin/nodejs /usr/bin/node

ENV uid 1000
ENV gid 1000
# Replace 1000 with your user / group id
RUN mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    chown ${uid}:${gid} -R /home/developer

ADD build.sh /usr/local/bin/build.sh
RUN chown developer:developer /usr/local/bin/build.sh
RUN chmod +x /usr/local/bin/build.sh

CMD ["/usr/local/bin/build.sh"]
