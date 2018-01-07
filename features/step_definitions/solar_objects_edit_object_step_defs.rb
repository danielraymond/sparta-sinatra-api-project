Given("I am on the solar objects page") do
  project_solar_objects_page.visit_home_page
end

And("I click on the link for a planet") do
  project_solar_objects_page.click_planet_link
end

And("I click the edit link on the show page") do
  project_solar_objects_show_page.click_edit_link
end

When("I enter valid planet details into the edit form") do
  project_solar_objects_edit_page.fill_in_edit_form_name_field('Hoth-updated')
  project_solar_objects_edit_page.fill_in_edit_form_object_type_field('Planet')
  project_solar_objects_edit_page.fill_in_edit_form_radius_field(2.0)
  project_solar_objects_edit_page.fill_in_edit_form_mass_field(2.0)
  project_solar_objects_edit_page.fill_in_edit_form_gravity_field(2.0)
  project_solar_objects_edit_page.click_submit_button
end

Then("I expect a the planet to be updated") do
  expect(project_solar_objects_page.find_solar_object_validation.text).to eq('Updated a new solar object!')
end

And("I click on the link for a moon") do
  project_solar_objects_page.click_moon_link
end

And("I click the edit link") do
  project_solar_objects_show_page.click_edit_link
end

When("I enter valid moon details into the edit form") do
  project_solar_objects_edit_page.fill_in_edit_form_name_field('Test Moon Updated')
  project_solar_objects_edit_page.fill_in_edit_form_object_type_field('Moon')
  project_solar_objects_edit_page.fill_in_edit_form_radius_field(2.0)
  project_solar_objects_edit_page.fill_in_edit_form_mass_field(2.0)
  project_solar_objects_edit_page.fill_in_edit_form_gravity_field(2.0)
  project_solar_objects_edit_page.fill_in_edit_form_planet_field('Test Planet Updated')
  project_solar_objects_edit_page.click_submit_button
end

Then("I expect a the moon to be updated") do
  expect(project_solar_objects_page.find_solar_object_validation.text).to eq('Updated a new solar object!')
end
