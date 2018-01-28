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
- **SEO and analytics**: Build in support for quick SEO metadata and drop in compatability with google tag manager
- **Workers and PubSub**: Sidekiq and Redis
- **Deployment**: Capistrano
- **Reverse Proxy**: Nginx

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


## Capistrano (On Digital Ocean)
### /config/deploy.rb
- Add your gihub URL to `set :repo_url`
- Add your application name to `set :application` (This will be used for folders etc)
- If your deployment user is not "deploy", change it under `set :user`

### /config/deploy/production.rb
- Add Digital Ocean Server IP to the first option for the *server*

## NGINX
- Update the `config/nginx.conf` for the *deploy user name* and the *app folder name* in the 4 location paths
- On the server, you will need to run the following two commands
  - Remove default nginx config: `sudo rm /etc/nginx/sites-enabled/default`
  - Syslink nginx config in app: `sudo ln -nfs "/home/{{ Your deploy user name }}/apps/{{ Your app folder name }}/current/config/nginx.conf" "/etc/nginx/sites-enabled/{{Your app folder name}}"`

## Puma
- Update the workers in `config/puma.rb` to match the number of cores on your production server


