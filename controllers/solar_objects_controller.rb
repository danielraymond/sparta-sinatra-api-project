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

  get '/index/:id' do

    id = params[:id].to_i

    @object = SolarObject.find(id)

    erb :'solar_objects/show'

  end

end
