FROM ruby:2.7
RUN apt-get update -qq && apt-get install -y lsb-release
RUN echo mysql-apt-config mysql-apt-config/select-server select mysql-5.7 | debconf-set-selections
RUN echo mysql-apt-config mysql-apt-config/select-product select Apply | debconf-set-selections
RUN wget -O /tmp/mysql-repo.deb https://dev.mysql.com/get/mysql-apt-config_0.8.15-1_all.deb
RUN DEBIAN_FRONTEND=noninteractive dpkg -i /tmp/mysql-repo.deb
RUN apt-get update
RUN apt-get install -y build-essential mysql-community-client
RUN curl -sL https://deb.nodesource.com/setup_current.x | bash -
RUN apt-get install -y nodejs
COPY diary/ /diary/
WORKDIR /diary
RUN bundle install
RUN npm install -g yarn
RUN yarn install
RUN bundle exec rails assets:precompile
COPY entrypoint.sh /usr/bin/
RUN chmod a+x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
EXPOSE 3000
CMD [ "rails", "server", "-b", "0.0.0.0" ]
