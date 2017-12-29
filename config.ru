require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './models/solar_objects.rb'
require_relative './controllers/solar_objects_controller.rb'

use Rack::MethodOverride

run SolarObjectsController
