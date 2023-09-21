FROM ruby:3.2.2

WORKDIR /src

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

RUN rm -f /src/tmp/pids/server.pid

EXPOSE 3000

CMD ["foreman", "start", "-f", "Procfile"]
