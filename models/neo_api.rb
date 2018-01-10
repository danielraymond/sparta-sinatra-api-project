require 'json'
require 'httparty'
require_relative '../config.rb'

class NeoAPI
  include HTTParty
  attr_accessor :nasa_data_today, :current_date

  base_uri 'https://api.nasa.gov/neo/rest/v1/feed'

  def initialize
    d = DateTime.now
    @current_date = d.strftime("%Y-%m-%d")
    get_nasa_neo_api_data(@current_date)
  end

  # method to consume the data from the nasa api using the current date found in the initialize method
  def get_nasa_neo_api_data(current_date)
    key = APIKEY.new.get_api_key
    @nasa_data_today = JSON.parse(self.class.get("?start_date=#{current_date}&end_date=#{current_date}&api_key=" + key).body)
  end

  # method to get all the neos from the api on the current date
  def get_neo_data
    @nasa_data_today['near_earth_objects'][current_date]
  end

  # method to get the biggest neo on current date
  def get_biggest
    biggest_diameter = 0.0
    @nasa_data_today['near_earth_objects'][current_date].each do |neo|
      if neo['estimated_diameter']['meters']['estimated_diameter_min'] > biggest_diameter
        biggest_diameter = neo['estimated_diameter']['meters']['estimated_diameter_min']
      end
    end
    @nasa_data_today['near_earth_objects'][current_date].each do |neo|
      if neo['estimated_diameter']['meters']['estimated_diameter_min'] == biggest_diameter
        return neo
      end
    end
  end

  # method to get the fastest neo on the current date
  def get_fastest
    fastest = 0.0
    @nasa_data_today['near_earth_objects'][current_date].each do |neo|
      if neo['close_approach_data'].first['relative_velocity']['miles_per_hour'].to_f > fastest
        fastest = neo['close_approach_data'].first['relative_velocity']['miles_per_hour'].to_f
      end
    end
    @nasa_data_today['near_earth_objects'][current_date].each do |neo|
      if neo['close_approach_data'].first['relative_velocity']['miles_per_hour'].to_f == fastest
        return neo
      end
    end
  end

  # method to get the closest neo on the current date
  def get_closest
    closest = @nasa_data_today['near_earth_objects'][current_date].first['close_approach_data'].first['miss_distance']['astronomical'].to_f
    @nasa_data_today['near_earth_objects'][current_date].each do |neo|
      if closest > neo['close_approach_data'].first['miss_distance']['astronomical'].to_f
        closest = neo['close_approach_data'].first['miss_distance']['astronomical'].to_f
      end
    end
    @nasa_data_today['near_earth_objects'][current_date].each do |neo|
      if neo['close_approach_data'].first['miss_distance']['astronomical'].to_f == closest
        return neo
      end
    end
  end

end
