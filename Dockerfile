FROM ruby:2.7
RUN apt-get update -qq && apt-get install -y nodejs
RUN mkdir /number_translation
WORKDIR /number_translation
COPY Gemfile /number_translation/Gemfile
COPY Gemfile.lock /number_translation/Gemfile.lock
RUN bundle install
COPY . /number_translation

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]