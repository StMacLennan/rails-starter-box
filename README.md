# Rails Starter Box

This is a template that I use to create new rails projects to take away some of the admin! Feel free to use it :)

## What's included
- **Ruby version**: Ruby 2.4.2
- **Framework**: Rails 5.1.4
- **Database**: Postgres
- **Webserver**: Puma
- **Testing**: Minitest, SimpleCov, Selenium, Capybara (For test coverage)
- **Debugging**: Pry
- **Authentication**: Devise
- **Authorization**: Pundit
- **Front-end**: Vue + Webpack + Turbolinks (setup to play nicely)
- **Javascript**: Excludes coffeescript in favor of plain Javascript
- **SCSS**: SCSS is setup with predefined files for application.scss, defaults.scss, and variables.scss
- **Development Environmen**: Docker and docker-compose

## Testing
A few notes on the testing environment
- I prefer Minitest over RSpec
- I also favour fixtures for testing consistency
- I have included a Pages controller, with a controller test as default
- I have also included a nonsense User system test to ensure that system tests work

## Getting started
To get started, just follow these steps:
- Clone this repo with 'git clone https://github.com/StMacLennan/rails-starter-box.git'
- Remove the existing .git with `rm -R .git/`
- Initialize git with `git init`
- Follow your normal steps to deposit this into your own repo
- Update the config/database.yml.example for your own database details, and rename to config/database.yml
- Update the config/secrets.yml.example with your own secrets, and rename to config/secrets.yml
- Run your tests as normal with `rails test`. And view the coverage, by opeing the coverage/index.html file in your browser

## Using Docker
This repo uses Docker and docker compose for the development environment. Here are a list of basic commands to get started:
- **First time**: The first time that you run this environment, and every time that you make a change to the **Gemfile**, run `docker-compose up --build`. This will download the images, and spin up the postgres and web containers
- **Setting up databases**: To setup and migrate your databases (test and dev), run `docker-compose exec web rails db:create db:migrate`
- **Tearing down containers**: To shut down containers, exit the instance in terminal with `control + c`, then run `docker-compose down` to shut down instances
- **Spinning back up**: To start up instances again, simply run `docker-compose up`
- **Running tests**: To run rails tests, run `docker-compose run "RAILS_ENV=test" web rails test`
- **Entering the console**: To enter the rails console, run `docker-compose exec web rails console`
- **Running migrations, generators etc**: To use any rails commands, such as db:migrate, or a generator, simply prepend the command with :`docker-compose exec web` and then your command. Eg: `docker-compose exec web rails db:migrate`

Note, all data will persist with the containers. So if you shut down the container, and then restart it, the data will still be there. If you wish to delete the database data, simply the `-v` flag when tearing down the containers. Eg:`docker-compose down -v`
