require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'httparty'
require 'json'
require_relative './models/solar_objects.rb'
require_relative './controllers/solar_objects_controller.rb'
require_relative './controllers/neo_api_controller'

use Rack::MethodOverride

run Rack::Cascade.new([
  SolarObjectsController,
  NeoAPIController
])
