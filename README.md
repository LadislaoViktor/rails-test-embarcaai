# rails-test-embarcaai

This application was created as a technical challenge for embarca. 
It's a rails 7 application using ruby 3. (0.0.0.0:3000/cities) 

To get the project running, you need to run th following commands:

docker-compose build

To create the database:
docker-compose run --rm web rake db:create

To run the migrations:
docker-compose run --rm web rake db:migrate

To seed the database with data:
docker-compose run --rm web rake db:seed

To run tests:

docker-compose run --rm web bash

RAILS_ENV=test

rake db:create

rake db:migrate

rake db:seed

ou 

rake db:setup

Para executar os testes:

bundle exec rspec path/to/*spec.rb 









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
