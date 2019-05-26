require 'capybara'

class ProjectSolarObjectsShowPage
  include Capybara::DSL

  def click_edit_link
    click_link('Edit')
  end

  def click_delete_button
    click_button('Delete')
  end

end
