FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  default-mysql-client vim 

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

WORKDIR /kakeibo_app

COPY Gemfile Gemfile.lock /kakeibo_app/

RUN yarn install --check-files
RUN bundle exec rails webpacker:compile

RUN gem install bundler
RUN bundle install