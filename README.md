## Sinatra Restful Web App with NASA NEO API Homepage Project

### How to run the app
The following steps are for running the app locally on a MacOS terminal.

Clone the repo onto your machine using the following command in your terminal:

```
git@github.com:danielraymond/sparta-sinatra-api-project.git
```

In your terminal run the following to install all the gems required to run the application:

```  
bundle install
```

 After this run the following command in your terminal to create and seed the PostgrSQL database:

```
psql -d solar_objects -a -f seed.sql
```

To host the app locally run the following when in the project directory:

```
rackup
```

The go to the following link:

http://localhost:9292/

In order to run the unit tests enter the following into your terminal:

```
rspec
```

In order to run the tests in the SOM (service object model) move into the service-object-model directory and enter the following
previous command into your terminal.

To run the UI tests written using capybara and cucumber use the following command in your terminal:

```
cucumber features/solar_objects_new_object.feature features/solar_objects_edit_object.feature features/solar_objects_delete_object.feature features
```
The feature files must be run in this order for the tests to work as they create update and delete the same value.

### Brief

The goal of this project was to produce a restful Sinatra web application that followed the MVC architectural pattern and used a resource stored in a Postgresql database as well as data consumed from the NASA [NEO API](https://api.nasa.gov/api.html#NeoWS).

The resource I created was solar objects which in this case is limited to just planets and moons. All CRUD (create, read, update and delete) operations could be could be used on this resource.

I used the [NEO Feed](https://api.nasa.gov/api.html#neows-feed) service using the current date as the start and end date in the following url:

https://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-07&end_date=2015-09-08&api_key=DEMO_KEY.

This returned a JSON object that contained all the near earth objects for the current day which I then displayed on the root page of the web app.

Automated unit, integration and UI tests were written to test the entire application. Unit tests were written using rspec, a testing tool for testing ruby code.

A SOM was created to test the data consumed from the API was returning the correct values and data types. Rspec was also used for this.

UI tests were written using using the Cucumber testing tool which runs automated acceptance testing. This was used in conjunction with capybara to access parts of the web page for testing using rspec. Tests were done for creating, editing and deleting a solar object.

#### Documentation:

RSPEC - http://rspec.info/documentation/

RSPEC Cheatsheet - https://www.anchor.com.au/wp-content/uploads/rspec_cheatsheet_attributed.pdf

Capybara - http://www.rubydoc.info/github/jnicklas/capybara

Capybara cheatsheet - https://devhints.io/capybara

Sinatra - http://sinatrarb.com/documentation.html
