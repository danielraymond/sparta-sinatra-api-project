require_relative '../models/neo_api.rb'
require 'sinatra/base'

class NeoAPIController < Sinatra::Base

  # sets the root of the controller
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # configure :development do
  #     register Sinatra::Reloader
  # end

  # request to the root
  get '/' do

    # sets the title of the page
    @title = 'Home'

    # creates a new instance of the model
    @api_data = NeoAPI.new

    # calls the get neo data function for use on the view
    @neo = @api_data.get_neo_data

    # calls the get fastest function for use on the view
    @fastest = @api_data.get_fastest

    # calls the get biggest function for use on the view
    @biggest = @api_data.get_biggest

    # calls the get closest function for use on the view
    @closest = @api_data.get_closest

    # sets the view for the get request
    erb :'neo_api/index'

  end

end
