Given("I am on the project home page") do
  project_home_page.visit_home_page
  sleep 1
end

When("I click the refresh info button") do
  project_home_page.click_refresh_button
  sleep 1
end

Then("the page successfully refreshes") do
  expect(project_home_page.get_home_page_title.text).to eq('NASA NEO API Information')
end
