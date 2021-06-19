FROM ruby:2.7.3-alpine AS builder

RUN apk add --no-cache \
    build-base libffi-dev \
    nodejs yarn tzdata \
    postgresql-dev postgresql-client zlib-dev libxml2-dev libxslt-dev readline-dev bash \
    #
    # For testing
    chromium chromium-chromedriver python3 python3-dev py3-pip \
    #
    # Nice-to-haves
    git vim \
    #
    # Fixes watch file issues with things like HMR
    libnotify-dev

RUN pip3 install -U selenium

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV PATH /usr/src/app/bin:$PATH

# Install latest bundler
RUN bundle config --global silence_root_warning 1

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]

COPY Gemfile /usr/src/app
COPY .ruby-version /usr/src/app
COPY Gemfile.lock /usr/src/app
RUN bundle install

COPY package.json /usr/src/app
COPY yarn.lock /usr/src/app
RUN yarn install --check-files

# Copy the rest of the app
COPY . /usr/src/app

# Precompile the assets
#RUN RAILS_SERVE_STATIC_FILES=enabled SECRET_KEY_BASE=secret-key-base RAILS_ENV=production RACK_ENV=production NODE_ENV=production bundle exec rake assets:precompile

# Precompile Bootsnap
#run RAILS_SERVE_STATIC_FILES=enabled SECRET_KEY_BASE=secret-key-base RAILS_ENV=production RACK_ENV=production NODE_ENV=production bundle exec bootsnap precompile --gemfile app/ lib/

#RUN bundle exec rake assets:precompile
