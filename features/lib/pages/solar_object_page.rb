require 'capybara'

class ProjectSolarObjectsPage
  include Capybara::DSL

  def visit_home_page
    visit('/index')
  end

  def click_new_object_link
    click_link('New Object')
  end

  def find_solar_object_validation
    find('#success')
  end

  def click_planet_link
    click_link('Hoth')
  end

  def click_moon_link
    click_link('Test Moon')
  end

  def click_planet_link_delete
    click_link('Hoth-updated')
  end

  def click_moon_link_delete
    click_link('Test Moon Updated')
  end

end
