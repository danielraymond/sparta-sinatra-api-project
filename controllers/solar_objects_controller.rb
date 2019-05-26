require 'sinatra/base'

class SolarObjectsController < Sinatra::Base

  # sets the root for the controller
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # configure :development do
  #   register Sinatra::Reloader
  # end

  # allows for the use of success messages for post, put and delete requests
  enable :sessions

  # a request to the index page
  get '/index' do

    # sets the title for the view
    @title = 'Solar Objects'

    # calls the function in the model for use in the view
    @solar_objects = SolarObject.all

    # success message for if there is a post, put or delete redirection
    @success_message = session[:success_message]
    session[:success_message] = nil

    # sets the view for the root
    erb :'solar_objects/index'

  end

  # sets what happens if a request is made to this root
  get '/index/new' do

    # sets the title for the view
    @title = 'New'

    # creates a new instance of the model
    @object = SolarObject.new

    # sets the view page for this root
    erb :'solar_objects/new'

  end

  # sets what happens if a request is made to this root
  get '/index/:id' do

    # sets the title for the view
    @title = 'Solar Object'

    # gets the id from the request
    id = params[:id].to_i

    # calls the information for the view from the model for an object with a given id
    @object = SolarObject.find(id)

    # sets the view page for this root
    erb :'solar_objects/show'

  end

  # sets what happens if a request is made to this root
  post '/index' do

    # creates a new instance of the model
    object = SolarObject.new

    # sets the values of the object from those given in the params from the form
    object.title = params[:title]
    object.object_type = params[:object_type]
    object.radius = params[:radius]
    object.mass = params[:mass]
    object.gravity = params[:gravity]
    object.planet = params[:planet]

    # calls the save method in the model
    object.save

    # sets success method for a post request
    session[:success_message] = "Added a new solar object!"

    # redirects to the index page
    redirect "/index"

  end

  # sets what happens if a request is made to this root
  put '/index/:id' do

    # takes the id from the params
    id = params[:id].to_i

    # calls the find method using the id
    object = SolarObject.find(id)

    # manipulate the variable to be the new data
    object.title = params[:title]
    object.object_type = params[:object_type]
    object.radius = params[:radius]
    object.mass = params[:mass]
    object.gravity = params[:gravity]
    object.planet = params[:planet]

    # changed the original data to the new data
    object.save

    # sets the success message for a put request
    session[:success_message] = "Updated a new solar object!"

    # redirects to the index page
    redirect '/index'

  end

  # sets what happens if a request is made to this root
  delete '/index/:id'  do

    # takes the id from the params
    id = params[:id].to_i

    # calls the destrou method in the model
    SolarObject.destroy(id)

    # sets the success message for a delete request
    session[:success_message] = "Successfully deleted solar object!"

    # redirects to the index page
    redirect '/index'

  end

  # sets what happens if a request is made to this root
  get '/index/:id/edit'  do

    # sets the title for the page
    @title = 'Edit'

    # takes the id from the params
    id = params[:id].to_i

    # finds the object using model method using the id
    @object = SolarObject.find(id)

    # sets the view page for this root
    erb :'solar_objects/edit'

  end

end
