require 'capybara'

class ProjectHomePage
  include Capybara::DSL

  def visit_home_page
    visit('/')
  end

  def click_refresh_button
    click_button('Refresh Info')
  end

  def get_home_page_title
    find('#neo-title')
  end

end
