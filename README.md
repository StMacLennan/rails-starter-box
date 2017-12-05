# Rails Starter Box

This is a template that I use to create new rails projects to take away some of the admin! Feel free to use it :)

## What's included
- **Ruby version**: Ruby 2.4.2
- **Framework**: Rails 5.1.4
- **Database**: Postgres
- **Webserver**: Puma
- **Testing**: Minitest, SimpleCov, Selenium, Capybara, SimpleCov (For test coverage)
- **Debugging**: Pry
- **Authentication**: Devise
- **Authorization**: Pundit
- **Front-end**: Vue + Webpack + Turbolinks (setup to play nicely)
- **Javascript**: Excludes coffeescript in favor of plain Javascript
- **SCSS and styling framework**: Bulma is used along with SCSS. While the styles do affect vue components, SCSS variables are not available to the vue components.
- **Development Environment**: Docker and docker-compose
- **SEO and analytics**: Build in support for quick SEO metadata and drop in compatability with google tag manager
- **Workers and PubSub**: Sidekiq and Redis

## Testing
A few notes on the testing environment
- I prefer Minitest over RSpec
- I also favour fixtures for testing consistency
- I have included a Pages controller, with a controller test as default
- I have also included a nonsense User system test to ensure that system tests work

## Getting started
To get started, just follow these steps:
- **Clone**: Clone this repo with 'git clone https://github.com/StMacLennan/rails-starter-box.git'
- **Remove git**: Remove the existing .git with `rm -R .git/`
- **Initialize your git**:Initialize git with `git init` and push to your own repo as normal
- **Setup database**: Rename `config/database.yml.example` to `config/database.yml` and update details in `.env`
- **Setup secrets**: Rename `config/secrets.yml.example` to `config/secrets.yml` and update secret in `.env`
- **Rename app**: Go through the app and replace all references to Rails Starter Box with your app name. Locations:
  - `views/layouts/application.html.erb` the title and site name
  - `config/application.rb` module name (Note the camel case)
  - `config/cable.yml`
  - `config/environments/production.rb`
- **Initialize yarn**: node modules are not committed to git.
  - Initialize yarn with `docker-compose exec web yarn init` and update details as required
  - Install packages with `docker-compose exec web yarn install`
- **Setup your database**: Create and initialize your database with `docker-compose exec web rails db:create db:migrate`
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

## SEO and meta data
This starter box already has meta-tags implemented. To configure it for your needs, simply do the following:
- Change the name of your app under `app/views/layouts/application.html.erb`
  - Change the `<title>RailsStarterBox</title>` to whatever your site is called
  - Change the `<%= display_meta_tags site: 'Rails Starter Box' %>` to whatever your site is called
- For each page, copy and configure the title, description and keywords for the template found under `app/controllers/pages_controller.rb` for the home page
- You can also read more about options etc (here)[https://github.com/kpumuk/meta-tags]

## Google Analytics and Tag Manager
This box supports google analytics using google tag manager
- Simply add your google tag manager container-id to `config/environments/production.rb` in the line `GoogleTagManager.gtm_id = "GTM-XXXX"`

## Sidekiq, Redis and Actioncable
Redis and sidekiq are already configured
- To setup workers, follow (this guide)[https://github.com/mperham/sidekiq/wiki/Getting-Started]
- To use actioncable:
  - Uncomment out the redis details in the .env file
  - Uncomment out the line `gem redis` in the Gemfile
  - Rebuild the containers for the change in gem file
  - Follow this guide on (Action Cable)[http://edgeguides.rubyonrails.org/action_cable_overview.html]
