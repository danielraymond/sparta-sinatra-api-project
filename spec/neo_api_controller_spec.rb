require_relative '../controllers/neo_api_controller.rb'
require_relative '../models/neo_api.rb'
require 'rack/test'
require 'json'
require 'httparty'
require 'pg'

describe 'NEO API Controller' do
  include Rack::Test::Methods

  def app
    NeoAPIController.new
  end

  it "displays nasa api neo data on homepage" do
    get "/"
    expect(last_response).to be_ok
    expect(last_response.body).to include('Fastest')
    expect(last_response.body).to include('Closest')
    expect(last_response.body).to include('Biggest')
    expect(last_response.body).to include('All Today\'s Near Earth Objects')
  end

end
