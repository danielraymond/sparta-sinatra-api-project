And("I click on the link for a planet that I want to delete") do
  project_solar_objects_page.click_planet_link_delete
end

When("I click on the delete button") do
  project_solar_objects_show_page.click_delete_button
end

Then("I expect a the planet to be deleted") do
  expect(project_solar_objects_page.find_solar_object_validation.text).to eq('Successfully deleted solar object!')
end

And("I click on the link for a moon that I want to delete") do
  project_solar_objects_page.click_moon_link_delete()
end

Then("I expect a the moon to be deleted") do
  expect(project_solar_objects_page.find_solar_object_validation.text).to eq('Successfully deleted solar object!')
end
