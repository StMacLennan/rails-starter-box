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
- **Front-end**: Webpack is installed, but a framework is not included yet for flexibility
- **Javascript**: Includes JQuery, excludes coffeescript in favor of plain Javascript
- **SCSS**: SCSS is setup with predefined files for application.scss, defaults.scss, and variables.scss

## Testing
A few notes on the testing environment
- I prefer Minitest over RSpec
- I also favour fixtures for testing consistency
- I have included a Pages controller, with a controller test as default
- I have also included a nonsense User system test to ensure that system tests work

## Using this Starter Box
To get started, just follow these steps:
- Clone this repo with 'git clone https://github.com/StMacLennan/rails-starter-box.git'
- Remove the existing .git with `rm -R .git/`
- Initialize git with `git init`
- Follow your normal steps to deposit this into your own repo
- Update the config/database.yml.example for your own database details, and rename to config/database.yml
- Update the config/secrets.yml.example with your own secrets, and rename to config/secrets.yml
- Run your tests as normal with `rails test`. And view the coverage, by opeing the coverage/index.html file in your browser
