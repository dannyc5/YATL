Given(/^I am on the problems page$/) do
  visit root_path
end

When(/^I fill out a new problem$/) do
  @new_problem = Faker::Lorem.sentence
  fill_in 'new_problem', with: @new_problem
end

When(/^I click add problem$/) do
  click_on "Add Problem"
end

Then(/^I should see the new problem$/) do
  expect(page).to have_content @new_problem
end
