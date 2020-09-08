FROM ruby:2.6.3-stretch
RUN gem update --system
RUN gem install bundler

ENV INSTALL_PATH /ruby-hl7
RUN mkdir -p $INSTALL_PATH

# This sets the context of where commands will be ran in and is documented
# on Docker's website extensively.
WORKDIR $INSTALL_PATH

# RUN apt-get update && apt-get install -y qt5-default libqt5webkit5-dev
# RUN apt-get update && apt-get install -y gcc g++ make
# RUN apt-get update &&  apt-get install -y inotify-tools

# Ensure gems are cached and only get updated when they change. This will
# drastically decrease build times when your gems do not change.
COPY Gemfile .
COPY Gemfile.lock .
COPY ruby-hl7.gemspec .
RUN bundle install

COPY . $INSTALL_PATH
