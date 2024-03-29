FROM ruby:3.1.3

LABEL maintainer="Kakada CHHEANG <kakada@kawsang.com>"

RUN apt-get update -qq && \
    apt-get install -y nodejs yarn cron && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN gem install bundler:2.1.4 && \
  bundle config set deployment 'true' && \
  bundle install --jobs 10

# Install the application
COPY . /app

# Generate version file if available
RUN if [ -d .git ]; then git describe --always > VERSION; fi

# Precompile assets
RUN bundle exec rake assets:precompile RAILS_ENV=production

ENV RAILS_LOG_TO_STDOUT=true
ENV RACK_ENV=production
ENV RAILS_ENV=production
EXPOSE 80

COPY docker/database.yml /app/config/database.yml

CMD ["puma", "-e", "production", "-b", "tcp://0.0.0.0:80"]
