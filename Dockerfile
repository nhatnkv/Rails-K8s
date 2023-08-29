# Use the official Ruby image with version 3.0.0 as the base image
FROM ruby:3.0.0

# Set the working directory in the container
WORKDIR /app

# Install node.js for Rails asset compilation
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update && apt-get install -y nodejs

# Install Rails dependencies
COPY Gemfile Gemfile.lock /app/
RUN gem install bundler && bundle install --jobs 4 --retry 3

# Copy the rest of the application code into the container
COPY . /app/

# Expose port 3000 to the Docker host
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]