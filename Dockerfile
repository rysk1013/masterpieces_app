FROM ruby:2.6.5

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - 
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq 
RUN apt-get install -y  nodejs yarn 
RUN mkdir /masterpieces_app

WORKDIR /masterpieces_app
COPY Gemfile /masterpieces_app/Gemfile
COPY Gemfile.lock /masterpieces_app/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /masterpieces_app

CMD ["rails", "server", "-b", "0.0.0.0"]
