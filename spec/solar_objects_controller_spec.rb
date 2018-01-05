require_relative '../controllers/solar_objects_controller.rb'
require_relative '../models/solar_objects.rb'
require 'rack/test'
require 'json'
require 'httparty'
require 'pg'

describe 'Solar Object Controller' do
  include Rack::Test::Methods

  def app
    SolarObjectsController.new
  end

  it "displays solar objects index page" do
    get "/index"
    expect(last_response).to be_ok
    expect(last_response.body).to include('Solar Objects')
    expect(last_response.body).to include('Planets')

  end

  it "displays new solar object page" do
    get '/index/new'
    expect(last_response).to be_ok
    expect(last_response.body).to include('newPlanet')
  end

  it "displays individual solar objects page" do
    get '/index/1'
    expect(last_response).to be_ok
    expect(last_response.body).to include('show-page')
  end

  it "displays the edit solar object page" do
    get '/index/1/edit'
    expect(last_response).to be_ok
    expect(last_response.body).to include('editPlanet')
  end

  it "post request to create a new solar object should work" do
    get '/index/new'
    post '/index', :object => {:title => 'Test', :object_type => 'Planet', :radius => 1.23, :mass => 4.56, :gravity => 7.89, :planet => ''}
    expect(last_response).to be_redirect
    follow_redirect!
    # expect(last_response.body).to include('Solar Objects')

  end

end
