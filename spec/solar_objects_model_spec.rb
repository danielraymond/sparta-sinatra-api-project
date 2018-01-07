require_relative '../controllers/solar_objects_controller.rb'
require_relative '../models/solar_objects.rb'
require 'rack/test'
require 'json'
require 'httparty'
require 'pg'

describe 'Solar Objects Model' do
  include Rack::Test::Methods

  def app
    SolarObjectsController.new
  end

  before(:all) do
    SolarObject.new
  end

  it "all method should return some values in an array" do
    expect(SolarObject.all).to be_kind_of(Array)
  end

  it "all method should return an object with table information" do
    SolarObject.all.each do |result|
      expect(result.id).to be_kind_of(String)
      expect(result.title).to be_kind_of(String)
      expect(result.object_type).to be_kind_of(String)
      expect(result.radius).to be_kind_of(String)
      expect(result.mass).to be_kind_of(String)
      expect(result.gravity).to be_kind_of(String)
      expect(result.planet).to be_kind_of(String).or eq(nil)
    end
  end

  it "find method should return an object with table information" do
    expect(SolarObject.find(1).id).to be_kind_of(String)
    expect(SolarObject.find(1).title).to be_kind_of(String)
    expect(SolarObject.find(1).object_type).to be_kind_of(String)
    expect(SolarObject.find(1).radius).to be_kind_of(String)
    expect(SolarObject.find(1).mass).to be_kind_of(String)
    expect(SolarObject.find(1).gravity).to be_kind_of(String)
    expect(SolarObject.find(1).planet).to be_kind_of(String).or eq(nil)
  end

  it "get highest id method should return an id" do
    expect(SolarObject.get_highest_id).to be_kind_of(Integer)
  end

end
