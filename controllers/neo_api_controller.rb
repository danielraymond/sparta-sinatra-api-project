require_relative '../models/neo_api.rb'
require 'sinatra/base'

class NeoAPIController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # configure :development do
  #     register Sinatra::Reloader
  # end

  get '/' do

    @api_data = NeoAPI.new

    @neo = @api_data.get_neo_data

    @fastest = @api_data.get_fastest

    @biggest = @api_data.get_biggest

    @closest = @api_data.get_closest

    erb :'neo_api/index'

  end

end
