require_relative '../models/neo_api.rb'

class NeoAPIController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
      register Sinatra::Reloader
  end

  get '/' do

    @api_data = NeoAPI.new

    @test =  @api_data.get_neo_data[0]['links']['self']

    erb :'neo_api/index'

  end

end
