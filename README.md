# rails-test-embarcaai

This application was created as a technical challenge for embarca. It's a rails 7 application using ruby 3, which accomplishes the following:

# Scenario
1. A rails app, built from scratch that should contain:
1. A table with these states from Brazil: Paraná, Santa Catarina, and the Rio Grande
do Sul
2. A table with some cities from Parana, Santa Catarina, and the Rio Grande do Sul
(at least 3 of each state)
2. A route to retrieve all cities based on some received params:
1. State
2. Part of the name
3. A frontend to display all cities that match with the search.
4. A test suite for this scenario

# Requirements
1. This app should be written with ruby version 2.7.0 and Rails version 5.x
2. This app should run in a docker container with docker-compose
3. This app should use PostgreSQL as a database
4. You need to use Rubocop to make sure your code follows the standards

# Tests
1. The tests should be written with RSpec
2. You should test the method responsible for search cities
3. You should test the route to search cities

# Code quality
1. Your code should not have any Rubocop complain

# Deliver
1. The code should be hosted on Github in a public repository.
2. The README should contain all instructions to run the test suite.
3. The README should contain all instructions to run the application.
4. Reply to this email with the URL from GitHub with your code.

To get the project running, you need to run th following commands:

docker-compose build

docker-compose run --rm web rake db:create
docker-compose run --rm web rake db:migrate
docker-compose run --rm web rake db:seed

To run tests:
bundle exec rspec spec/models/city_spec.rb 





Things you may want to cover:

* Ruby version: ruby 3.0.6p216 (2023-03-30 revision 23a532679b) [x86_64-linux]

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
