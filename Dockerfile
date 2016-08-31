FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client
ENV RAILS_ROOT /var/www/devops-rails-example
RUN mkdir -p $RAILS_ROOT/tmp/pids
WORKDIR $RAILS_ROOT
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . .
CMD ["rails", "server", "-b", "0.0.0.0"]
