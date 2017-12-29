class SolarObjectsController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
      register Sinatra::Reloader
  end

  get '/' do

    @title = 'HELLO THERE THIS IS WORKING'

    erb :'solar_objects/index'

  end

end
