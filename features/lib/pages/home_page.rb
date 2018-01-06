require 'capybara'

class ProjectHomePage
  include Capybara::DSL

  def visit_home_page
    visit('/')
  end

  def click_refresh_button
    click_button('Refresh Info')
  end

end
