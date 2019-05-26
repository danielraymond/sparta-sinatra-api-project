require 'capybara'

class ProjectSolarObjectsNewPage
  include Capybara::DSL

  NAME_FIELD_ID = 'title-new' unless const_defined?(:NAME_FIELD_ID)
  OBJECT_TYPE_FIELD_ID = 'object-type-new' unless const_defined?(:OBJECT_TYPE_FIELD_ID)
  RADIUS_FIELD_ID = 'radius-new' unless const_defined?(:RADIUS_FIELD_ID)
  MASS_FIELD_ID = 'mass-new' unless const_defined?(:MASS_FIELD_ID)
  GRAVITY_FIELD_ID = 'gravity-new' unless const_defined?(:GRAVITY_FIELD_ID)
  PLANET_FIELD_ID = 'planet-new' unless const_defined?(:PLANET_FIELD_ID)

  def fill_in_new_form_name_field(name)
    fill_in(NAME_FIELD_ID, with: name)
  end

  def fill_in_new_form_object_type_field(object_type)
    fill_in(OBJECT_TYPE_FIELD_ID, with: object_type)
  end

  def fill_in_new_form_radius_field(radius)
    fill_in(RADIUS_FIELD_ID, with: radius)
  end

  def fill_in_new_form_mass_field(mass)
    fill_in(MASS_FIELD_ID, with: mass)
  end

  def fill_in_new_form_gravity_field(gravity)
    fill_in(GRAVITY_FIELD_ID, with: gravity)
  end

  def fill_in_new_form_planet_field(planet)
    fill_in(PLANET_FIELD_ID, with: planet)
  end

  def click_submit_button
    click_button('Create Object')
  end


end
