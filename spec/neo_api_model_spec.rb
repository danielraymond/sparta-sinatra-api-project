require_relative '../controllers/neo_api_controller'
require_relative '../models/neo_api.rb'
require 'rack/test'
require 'json'
require 'httparty'
require 'pg'

describe 'NEO API Model' do
  include Rack::Test::Methods

  def app
    NeoAPIController.new
  end

  before(:all) do
    @neo_data = NeoAPI.new
  end

  it "get biggest method should return a hash" do
    expect(@neo_data.get_biggest).to be_kind_of(Hash)
  end

  it "get fastest method should return a hash" do
    expect(@neo_data.get_fastest).to be_kind_of(Hash)
  end

  it "get closest method should return a hash" do
    expect(@neo_data.get_closest).to be_kind_of(Hash)
  end

  it "get neo data should return a hash of all the near earth objects" do
    expect(@neo_data.get_neo_data).to be_kind_of(Hash)
  end

end
