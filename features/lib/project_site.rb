require_relative '../lib/pages/home_page'

module ProjectSite

  def project_home_page
    ProjectHomePage.new
  end

  def project_solar_objects_page
    ProjectSolarObjectsPage.new
  end

  def project_solar_objects_new_page
    ProjectSolarObjectsNewPage.new
  end

  def project_solar_objects_edit_page
    ProjectSolarObjectsEditPage.new
  end

  def project_solar_objects_show_page
    ProjectSolarObjectsShowPage.new
  end

end
