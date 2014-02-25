

##Requirements:
  - Ruby 2.1.0/Rails 4+
  - Mongodb
  - Nodejs
  - Statsd
  - Mongo-statsd-backend
  
The server must be running as the client fetches user, page, and metric data via http get.  The settings under run_client.rb assume localhost:3000.  

##How To
Setup and run web server

    $ cd statsd3
    $ bundle
    $ rake db:create
    $ rake db:migrate
    $ rake db:seed
    $ rails s

Run Statsd

    $ cd statsd && node stats.js config.js

Run client 

    $ cd statsd_client && ruby run_client.rb

