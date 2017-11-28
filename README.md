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
- I prefer Minitest over RSpec.
- I also favour fixtures for testing consistency.


## Using this Starter Box
To get started, just follow these steps:
- Clone this repo with 'git clone https://github.com/StMacLennan/rails-starter-box.git'
- Update the config/database.yml.example for your own database details, and rename to config/database.yml
- Update the config/secrets.yml.example with your own secrets, and rename to config/secrets.yml
