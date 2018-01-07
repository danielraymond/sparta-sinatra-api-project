require 'capybara'

class ProjectSolarObjectsPage
  include Capybara::DSL

  def visit_home_page
    visit('/index')
  end

end
