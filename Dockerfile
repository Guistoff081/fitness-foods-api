# Use the official Ruby 3.0 image as a base image
FROM ruby:3.2.2

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update -qq && apt-get install -y \
    nodejs \
    postgresql-client

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the application code into the container
COPY . .

# Expose port 3000 for the Rails server
EXPOSE 3000

# Start the Rails server using Foreman
CMD ["foreman", "start", "-f", "Procfile.dev"]
