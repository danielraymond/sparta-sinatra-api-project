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
  end

  it "solar objects index page contains table headings for the planets and moons tables" do
    get "/index"
    expect(last_response.body).to include('<th>Planet Name</th>')
    expect(last_response.body).to include('<th>Radius (Earth\'s Radius)</th>')
    expect(last_response.body).to include('<th>Mass (Earth\'s Mass)</th>')
    expect(last_response.body).to include('<th>Gravitational Acceleration (m/s^2)</th>')
    expect(last_response.body).to include('<th>Moon Name</th>')
    expect(last_response.body).to include('<th>Planet Moon Orbits</th>')
  end

  it "displays new solar object page" do
    get '/index/new'
    expect(last_response).to be_ok
    expect(last_response.body).to include('newPlanet')
  end

  it "displays individual solar objects page" do
    get '/index/2'
    expect(last_response).to be_ok
    expect(last_response.body).to include('show-page')
  end

  it "show page includes an edit link" do
    get '/index/2'
    expect(last_response.body).to include('<a href="/index/2/edit">Edit</a>')
  end

  it "show page should have a delete button" do
    get '/index/2'
    expect(last_response.body).to include('<input type="hidden" name="_method" value="DELETE">')
  end

  it "displays the edit solar object page" do
    get '/index/2/edit'
    expect(last_response).to be_ok
    expect(last_response.body).to include('editPlanet')
  end

  it "post request to create a new solar object should work" do
    params = {:title => 'Test for post', :object_type => 'Planet', :radius => 1.0, :mass => 1.0, :gravity => 9.81, :planet => ''}
    post '/index', params
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response.body).to include('Test for post')
  end

  it "put request should update an existing solar object" do
    params = params = {:title => 'Earth-update', :object_type => 'Planet', :radius => 1.23, :mass => 4.56, :gravity => 7.89, :planet => ''}
    SolarObject.new
    @id = SolarObject.get_highest_id
    put "/index/#{@id}", params
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response.body).to include('Earth-update')
  end

  it "delete request should delete a solar object" do
    SolarObject.new
    @id = SolarObject.get_highest_id
    delete "/index/#{@id}"
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response.body).not_to include('Test for post')
  end

end
