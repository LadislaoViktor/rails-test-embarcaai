# rails-test-embarcaai

This application was created as a technical challenge for embarca. 
It's a **rails 7** application using **ruby 3**. [Geo](http:0.0.0.0:3000/cities) 

To get the project running, you need to run th following commands:

*docker-compose build*

To create the database:

*docker-compose run --rm web rake db:setup*

To run tests:
*docker-compose run --rm web bash*

an then:
*rake db:setup*

To run the tests,being on the container's bash:

*rspec path/to/*spec.rb *

or:

*rspec*

