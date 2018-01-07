require 'httparty'
require 'json'

class NEOCurrentDateService
  include HTTParty

  base_uri 'https://api.nasa.gov/neo/rest/v1/feed'

  def initialize
    d = DateTime.now
    @current_date = d.strftime("%Y-%m-%d")
    get_nasa_neo_api_data(@current_date)
  end

  def get_nasa_neo_api_data(current_date)
    @nasa_data_today = JSON.parse(self.class.get("?start_date=#{current_date}&end_date=#{current_date}&api_key=ZTrkZpPB61MRLR16vCn7HkAJsSQAKeCMkQmgBW0s").body)
  end

  def get_hash_of_api_data
    @nasa_data_today
  end

  def get_links
    @nasa_data_today['links']
  end

  def get_next_link
    @nasa_data_today['links']['next']
  end

  def get_prev_link
    @nasa_data_today['links']['prev']
  end

  def get_self_link
    @nasa_data_today['links']['self']
  end

  def get_element_count
    @nasa_data_today['element_count']
  end

  def get_near_earth_objects_hash
    @nasa_data_today['near_earth_objects']
  end

  def get_date_array
    @nasa_data_today['near_earth_objects'][@current_date]
  end

  def get_individual_links
    links = []
    get_date_array.each do |neo|
      links << neo['links']
    end
    links
  end

  def get_individual_self_links
    links = []
    get_date_array.each do |neo|
      links << neo['links']['self']
    end
    links
  end

  def get_neo_reference_ids
    ids = []
    get_date_array.each do |neo|
      ids << neo['neo_reference_id']
    end
    ids
  end

  def get_neo_names
    names = []
    get_date_array.each do |neo|
      names << neo['name']
    end
    names
  end

  def get_nasa_jpl_url
    urls = []
    get_date_array.each do |neo|
      urls << neo['nasa_jpl_url']
    end
    urls
  end

  def get_absolute_magnitudes
    magnitudes = []
    get_date_array.each do |neo|
      magnitudes << neo['absolute_magnitude_h']
    end
    magnitudes
  end

  def get_estimated_diameters
    diameters = []
    get_date_array.each do |neo|
      diameters << neo['estimated_diameter']
    end
    diameters
  end

  def get_estimated_diameters_kilometer
    kilometers = []
    get_date_array.each do |diameter|
      kilometers << diameter['estimated_diameter']['kilometers']
    end
    kilometers
  end

  def get_estimated_diameters_meter
    meters = []
    get_date_array.each do |diameter|
      meters << diameter['estimated_diameter']['meters']
    end
    meters
  end

  def get_estimated_diameters_mile
    miles = []
    get_date_array.each do |diameter|
      miles << diameter['estimated_diameter']['miles']
    end
    miles
  end

  def get_estimated_diameters_feet
    feet = []
    get_date_array.each do |diameter|
      feet << diameter['estimated_diameter']['feet']
    end
    feet
  end

  def get_estimated_diameter_min_kilometer
    mins = []
    get_date_array.each do |diameter|
      mins << diameter['estimated_diameter']['kilometers']['estimated_diameter_min']
    end
    mins
  end

  def get_estimated_diameter_max_kilometer
    maxes = []
    get_date_array.each do |diameter|
      maxes << diameter['estimated_diameter']['kilometers']['estimated_diameter_max']
    end
    maxes
  end

  def get_estimated_diameter_min_meter
    mins = []
    get_date_array.each do |diameter|
      mins << diameter['estimated_diameter']['meters']['estimated_diameter_min']
    end
    mins
  end

  def get_estimated_diameter_max_meter
    maxes = []
    get_date_array.each do |diameter|
      maxes << diameter['estimated_diameter']['meters']['estimated_diameter_max']
    end
    maxes
  end

  def get_estimated_diameter_min_mile
    mins = []
    get_date_array.each do |diameter|
      mins << diameter['estimated_diameter']['miles']['estimated_diameter_min']
    end
    mins
  end

  def get_estimated_diameter_max_mile
    maxes = []
    get_date_array.each do |diameter|
      maxes << diameter['estimated_diameter']['miles']['estimated_diameter_max']
    end
    maxes
  end

  def get_estimated_diameter_min_feet
    mins = []
    get_date_array.each do |diameter|
      mins << diameter['estimated_diameter']['feet']['estimated_diameter_min']
    end
    mins
  end

  def get_estimated_diameter_max_feet
    maxes = []
    get_date_array.each do |diameter|
      maxes << diameter['estimated_diameter']['feet']['estimated_diameter_max']
    end
    maxes
  end

  def get_potentially_hazardous
    asteroids = []
    get_date_array.each do |neo|
      asteroids << neo['is_potentially_hazardous_asteroid']
    end
    asteroids
  end

  def get_close_approach_data
    close = []
    get_date_array.each do |neo|
      close << neo['close_approach_data']
    end
    close
  end

  def get_close_approach_data_hash
    close = []
    get_date_array.each do |neo|
      close << neo['close_approach_data'].first
    end
    close
  end

  def get_close_approach_date
    data = []
    get_date_array.each do |neo|
      data << neo['close_approach_data'].first['close_approach_date']
    end
    data
  end

  def get_epoch_date_close_approach
    data = []
    get_date_array.each do |neo|
      data << neo['close_approach_data'].first['epoch_date_close_approach']
    end
    data
  end

  def get_relative_velocity
    data = []
    get_date_array.each do |neo|
      data << neo['close_approach_data'].first['relative_velocity']
    end
    data
  end

  def get_kilometers_per_second
    data = []
    get_date_array.each do |neo|
      data << neo['close_approach_data'].first['relative_velocity']['kilometers_per_second']
    end
    data
  end

end
