require 'json'
require 'httparty'

class NeoAPI
  include HTTParty
  attr_accessor :nasa_data_today, :current_date

  base_uri 'https://api.nasa.gov/neo/rest/v1/feed'

  def initialize
    d = DateTime.now
    @current_date = d.strftime("%Y-%m-%d")
    get_nasa_neo_api_data(@current_date)
  end

  def get_nasa_neo_api_data(current_date)
    @nasa_data_today = JSON.parse(self.class.get("?start_date=#{current_date}&end_date=#{current_date}&api_key=ZTrkZpPB61MRLR16vCn7HkAJsSQAKeCMkQmgBW0s").body)
  end

  def get_neo_data
    @nasa_data_today['near_earth_objects'][current_date]
  end

  def get_number_of_neos
    @nasa_data_today['element_count']
  end

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

# x = NeoAPI.new
# p x.get_neo_data
# p "---------------------------------------------------------"
# p x.get_closest
