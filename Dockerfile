FROM ruby:2.7.2

# Install VIM in the event we want to connect to the container
RUN apt-get update -qq && apt-get install -y vim

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD . $APP_HOME/

ENV BUNDLER_WITHOUT development test
RUN bundle install

CMD ["rackup", "--host", "0.0.0.0", "-p", "5000"]
