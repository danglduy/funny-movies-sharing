FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y postgresql-client
SHELL ["/bin/bash", "-eo", "pipefail", "-c"]

ENV APP_ROOT=/app
RUN mkdir ${APP_ROOT}
ENV PATH=${APP_ROOT}/bin:${PATH}

ENV GEM_HOME=${APP_ROOT}/vendor/bundle
ENV BUNDLE_PATH=${GEM_HOME} \
  BUNDLE_BIN=${GEM_HOME}/bin \
  BUNDLE_APP_CONFIG=${GEM_HOME}

WORKDIR ${APP_ROOT}

COPY Gemfile Gemfile.lock ${APP_ROOT}/
COPY vendor ${APP_ROOT}/vendor

RUN gem install bundler:2.3.19
RUN echo "gem: --no-rdoc --no-ri" > ~/.gemrc
RUN bundle config set --local deployment 'true'
RUN bundle install

EXPOSE 3000

CMD ["./entrypoint.sh"]
