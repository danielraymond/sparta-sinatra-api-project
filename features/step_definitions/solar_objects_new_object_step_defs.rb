Given("I am on the solar objects index page") do
  project_solar_objects_page.visit_home_page
end

And("I move to the new object page") do
  project_solar_objects_page.click_new_object_link
end

When("I enter valid planet details into the form") do
  project_solar_objects_new_page.fill_in_new_form_name_field('Hoth')
  project_solar_objects_new_page.fill_in_new_form_object_type_field('Planet')
  project_solar_objects_new_page.fill_in_new_form_radius_field(1.0)
  project_solar_objects_new_page.fill_in_new_form_mass_field(1.0)
  project_solar_objects_new_page.fill_in_new_form_gravity_field(1.0)
  project_solar_objects_new_page.click_submit_button
end

When("I enter valid moon details into the form") do
  project_solar_objects_new_page.fill_in_new_form_name_field('Test Moon')
  project_solar_objects_new_page.fill_in_new_form_object_type_field('Moon')
  project_solar_objects_new_page.fill_in_new_form_radius_field(1.0)
  project_solar_objects_new_page.fill_in_new_form_mass_field(1.0)
  project_solar_objects_new_page.fill_in_new_form_gravity_field(1.0)
  project_solar_objects_new_page.fill_in_new_form_planet_field('Test Planet')
  project_solar_objects_new_page.click_submit_button
end

Then("I expect a new planet to be created") do
  expect(project_solar_objects_page.find_solar_object_validation.text).to eq('Added a new solar object!')
end

Then("I expect a new moon to be created") do
  expect(project_solar_objects_page.find_solar_object_validation.text).to eq('Added a new solar object!')
end
