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

ENV INSTALL_PATH /usr/src/app
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

RUN bundle install
RUN yarn install --check-files

# Precompile the assets
#RUN RAILS_SERVE_STATIC_FILES=enabled SECRET_KEY_BASE=secret-key-base RAILS_ENV=production RACK_ENV=production NODE_ENV=production bundle exec rake assets:precompile

# Precompile Bootsnap
#run RAILS_SERVE_STATIC_FILES=enabled SECRET_KEY_BASE=secret-key-base RAILS_ENV=production RACK_ENV=production NODE_ENV=production bundle exec bootsnap precompile --gemfile app/ lib/

#RUN bundle exec rake assets:precompile
