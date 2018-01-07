require 'spec_helper'

describe NEOAPI do

  before(:all) do
    @neo_data = NEOAPI.new.neo_current_date_service
  end

  it "should return a hash with all the api information" do
    expect(@neo_data.get_hash_of_api_data).to be_kind_of(Hash)
  end

  it "should return a hash with 3 keys" do
    expect(@neo_data.get_hash_of_api_data.length).to eq(3)
  end

  it "should return a hash of links" do
    expect(@neo_data.get_links).to be_kind_of(Hash)
  end

  it "should have 3 links in the links hash" do
    expect(@neo_data.get_links.length).to eq(3)
  end

  it "next link should be a string" do
    expect(@neo_data.get_next_link).to be_kind_of(String)
  end

  it "prev link should be a string" do
    expect(@neo_data.get_prev_link).to be_kind_of(String)
  end

  it "self link should be a string" do
    expect(@neo_data.get_self_link).to be_kind_of(String)
  end

  it "element count key should have an integer value" do
    expect(@neo_data.get_element_count).to be_kind_of(Integer)
  end

  it "should have a near earth objects key that is a hash" do
    expect(@neo_data.get_near_earth_objects_hash).to be_kind_of(Hash)
  end

  it "should have a key inside the near earth objects hash that is an array" do
    expect(@neo_data.get_date_array).to be_kind_of(Array)
  end

  it "length of date array should equal element count" do
    expect(@neo_data.get_date_array.length).to eq(@neo_data.get_element_count)
  end

  it "date array elements should be hashes" do
    @neo_data.get_date_array.each do |neo|
      expect(neo).to be_kind_of(Hash)
    end
  end

  it "date array hashes should contain 8 keys" do
    @neo_data.get_date_array.each do |neo|
      expect(neo.length).to eq(8)
    end
  end

  it "each neo should have a links hash" do
    @neo_data.get_individual_links.each do |link|
      expect(link).to be_kind_of(Hash)
    end
  end

  it "each neo should have a links hash with a self key that is a string" do
    @neo_data.get_individual_self_links.each do |link|
      expect(link).to be_kind_of(String)
    end
  end

  it "each neo should have a reference id that is a string" do
    @neo_data.get_neo_reference_ids.each do |id|
      expect(id).to be_kind_of(String)
    end
  end

  it "each neo should have a links hash" do
    @neo_data.get_neo_names.each do |name|
      expect(name).to be_kind_of(String)
    end
  end

  it "each neo should have a nasa jpl url that is a string" do
    @neo_data.get_nasa_jpl_url.each do |url|
      expect(url).to be_kind_of(String)
    end
  end

  it "each neo should have an absolute magnitude that is a float" do
    @neo_data.get_absolute_magnitudes.each do |magnitude|
      expect(magnitude).to be_kind_of(Float)
    end
  end

  it "each absolute magnitude should be between -27 and 32" do
    @neo_data.get_absolute_magnitudes.each do |magnitude|
      expect(magnitude).to be_between(-27.0, 32)
    end
  end

  it "each neo should have an estimated diameter hash" do
    @neo_data.get_estimated_diameters.each do |diameter|
      expect(diameter).to be_kind_of(Hash)
    end
  end

  it "each neo should have an estimated diameter hash with 4 keys" do
    @neo_data.get_estimated_diameters.each do |diameter|
      expect(diameter.length).to eq(4)
    end
  end

  it "each estimated diameter key should have 2 keys" do
    @neo_data.get_estimated_diameters_kilometer.each do |kilometer|
      expect(kilometer.length).to eq(2)
    end
    @neo_data.get_estimated_diameters_meter.each do |meter|
      expect(meter.length).to eq(2)
    end
    @neo_data.get_estimated_diameters_mile.each do |mile|
      expect(mile.length).to eq(2)
    end
    @neo_data.get_estimated_diameters_feet.each do |feet|
      expect(feet.length).to eq(2)
    end
  end

  it "each estimated diamter key should be a hash" do
    @neo_data.get_estimated_diameters_kilometer.each do |kilometer|
      expect(kilometer).to be_kind_of(Hash)
    end
    @neo_data.get_estimated_diameters_meter.each do |meter|
      expect(meter).to be_kind_of(Hash)
    end
    @neo_data.get_estimated_diameters_mile.each do |mile|
      expect(mile).to be_kind_of(Hash)
    end
    @neo_data.get_estimated_diameters_feet.each do |feet|
      expect(feet).to be_kind_of(Hash)
    end
  end

  it "each estimated diamater min in kilometers should be a float" do
    @neo_data.get_estimated_diameter_min_kilometer.each do |min|
      expect(min).to be_kind_of(Float)
    end
  end

  it "each estimated diamater max in kilometers should be a float" do
    @neo_data.get_estimated_diameter_max_kilometer.each do |max|
      expect(max).to be_kind_of(Float)
    end
  end

  it "each estimated diamater min in meters should be a float" do
    @neo_data.get_estimated_diameter_min_meter.each do |min|
      expect(min).to be_kind_of(Float)
    end
  end

  it "each estimated diamater max in meters should be a float" do
    @neo_data.get_estimated_diameter_max_meter.each do |max|
      expect(max).to be_kind_of(Float)
    end
  end

  it "each estimated diamater min in miles should be a float" do
    @neo_data.get_estimated_diameter_min_mile.each do |min|
      expect(min).to be_kind_of(Float)
    end
  end

  it "each estimated diamater max in miles should be a float" do
    @neo_data.get_estimated_diameter_max_mile.each do |max|
      expect(max).to be_kind_of(Float)
    end
  end

  it "each estimated diamater min in feet should be a float" do
    @neo_data.get_estimated_diameter_min_feet.each do |min|
      expect(min).to be_kind_of(Float)
    end
  end

  it "each estimated diamater max in feet should be a float" do
    @neo_data.get_estimated_diameter_max_feet.each do |max|
      expect(max).to be_kind_of(Float)
    end
  end

  it "each potentially hazardous asteroid value should be a boolean" do
    @neo_data.get_potentially_hazardous.each do |asteroid|
      expect(asteroid).to eq(false).or eq(true)
    end
  end

  it "close approach data key should be an array" do
    @neo_data.get_close_approach_data.each do |neo|
      expect(neo).to be_kind_of(Array)
    end
  end

  it "close approach data key should contain one element" do
    @neo_data.get_close_approach_data.each do |neo|
      expect(neo.length).to eq(1)
    end
  end

  it "close approach data element should be a hash" do
    @neo_data.get_close_approach_data_hash.each do |neo|
      expect(neo).to be_kind_of(Hash)
    end
  end

  it "close approach data hash should have 5 elements" do
    @neo_data.get_close_approach_data_hash.each do |neo|
      expect(neo.length).to eq(5)
    end
  end

  it "each close approach date should be a string" do
    @neo_data.get_close_approach_date.each do |neo|
      expect(neo).to be_kind_of(String)
    end
  end

  it "each epoch date close approach date should be an integer" do
    @neo_data.get_epoch_date_close_approach.each do |neo|
      expect(neo).to be_kind_of(Integer)
    end
  end

  it "each relative velocity should be a hash" do
    @neo_data.get_relative_velocity.each do |neo|
      expect(neo).to be_kind_of(Hash)
    end
  end

  it "each relative velocity should be a have 3 keys" do
    @neo_data.get_relative_velocity.each do |neo|
      expect(neo.length).to eq(3)
    end
  end

  it "each relative velocity in kilometers per second should be a string" do
    @neo_data.get_kilometers_per_second.each do |neo|
      expect(neo).to be_kind_of(String)
    end
  end

  it "each relative velocity in kilometers per hour should be a string" do
    @neo_data.get_kilometers_per_hour.each do |neo|
      expect(neo).to be_kind_of(String)
    end
  end

  it "each relative velocity in miles per hour should be a string" do
    @neo_data.get_miles_per_hour.each do |neo|
      expect(neo).to be_kind_of(String)
    end
  end

  it "each miss distance should be a hash" do
    @neo_data.get_miss_distance.each do |neo|
      expect(neo).to be_kind_of(Hash)
    end
  end

  it "each miss distance should have 4 keys" do
    @neo_data.get_miss_distance.each do |neo|
      expect(neo.length).to eq(4)
    end
  end

  it "each miss distance in astronomical units should be a string" do
    @neo_data.get_astronomical.each do |neo|
      expect(neo).to be_kind_of(String)
    end
  end

  it "each miss distance in lunar units should be a string" do
    @neo_data.get_lunar.each do |neo|
      expect(neo).to be_kind_of(String)
    end
  end

  it "each miss distance in kilometer units should be a string" do
    @neo_data.get_kilometers.each do |neo|
      expect(neo).to be_kind_of(String)
    end
  end

  it "each miss distance in mile units should be a string" do
    @neo_data.get_miles.each do |neo|
      expect(neo).to be_kind_of(String)
    end
  end

  it "each orbiting body should be Earth" do
    @neo_data.get_orbiting_body.each do |neo|
      expect(neo).to eq('Earth')
    end
  end

end
