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
  end

  it "displays the fastest neo on homepage" do
    get "/"
    expect(last_response.body).to include("<h2>Today's Fastest Near Earth Object</h2>")
  end

  it "displays the biggest neo on homepage" do
    get "/"
    expect(last_response.body).to include ("<h2>Today's Biggest Near Earth Object</h2>")
  end

  it "displays the closest neo on homepage" do
    get "/"
    expect(last_response.body).to include ("<h2>Today's Closest Near Earth Object</h2>")
  end

  it "displays all the neos for the day" do
    get "/"
    expect(last_response.body).to include("All Today's Near Earth Objects")
  end

  it "should include all the table headings for the data" do
    get "/"
    expect(last_response.body).to include("<th>Name</th>")
    expect(last_response.body).to include("<th>Absolute Magnitude (h)</th>")
    expect(last_response.body).to include("<th>Estimated Minimum Diameter (m)</th>")
    expect(last_response.body).to include("<th>Estimated Maximum Diameter (m)</th>")
    expect(last_response.body).to include("<th>Relative Velocity (mph)</th>")
    expect(last_response.body).to include("<th>Miss Distance (AU)</th>")
    expect(last_response.body).to include("<th>Potentially Hazardous (True/False)</th>")
  end

  it "should include a navbar with all the correct links" do
    get "/"
    expect(last_response.body).to include('<a class="nav-a" href="/">Today\'s Near Earth Objects</a>')
    expect(last_response.body).to include('<a class="nav-a" href="/index">Solar Objects</a>')
    expect(last_response.body).to include('<a class="nav-a" href="/index/new">New Object</a>')
  end

end
