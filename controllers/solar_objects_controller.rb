class SolarObjectsController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
      register Sinatra::Reloader
  end

  get '/index' do

    @title = 'HELLO THERE THIS IS WORKING'
    @solar_objects = SolarObject.all

    erb :'solar_objects/index'

  end

  get '/index/new' do

    @object = SolarObject.new

    erb :'solar_objects/new'

  end

  get '/index/:id' do

    id = params[:id].to_i

    @object = SolarObject.find(id)

    erb :'solar_objects/show'

  end

  post '/index' do

    object = SolarObject.new

    object.title = params[:title]
    object.object_type = params[:object_type]
    object.radius = params[:radius]
    object.mass = params[:mass]
    object.gravity = params[:gravity]
    object.planet = params[:planet]

    object.save

    redirect "/index"

  end

  put '/index/:id' do

    id = params[:id].to_i

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

    redirect '/index'

  end

  delete '/index/:id'  do

    id = params[:id].to_i

    SolarObject.destroy(id)

    redirect '/index'

  end

  get '/index/:id/edit'  do

    id = params[:id].to_i

    @object = SolarObject.find(id)

    erb :'solar_objects/edit'

  end

end
