Given("I am on the project_home_page") do
  project_home_page.visit_home_page
end

When("I click the refresh info button") do
  project_home_page.click_refresh_button
  sleep 4
end

Then("The page successfully refreshes") do
  pending # Write code here that turns the phrase above into concrete actions
end
