Given(/^I am on the problems page$/) do
  visit root_path
end

Given(/^I have a problem$/) do
  @problem = create(:problem)
end

When(/^I fill out a new problem$/) do
  @new_message = Faker::Lorem.sentence
  fill_in 'new_problem', with: @new_message
end

When(/^I click add problem$/) do
  click_on "Add Problem"
end

When(/^I click delete for a problem$/) do
  within all(:css, ".problem").last do
    click_link "Delete"
  end
end

When(/^I click edit for a problem$/) do
  within all(:css, ".problem").first do
    click_link "Edit"
  end
end

When(/^I edit the problem message$/) do
  @new_message = Faker::Lorem.sentence
  fill_in 'Edit Message', with: @new_message
  click_on 'Save Message'
end

Then(/^I should see the new problem$/) do
  expect(page).to have_content @new_message
end

Then(/^I should not see the problem$/) do
  expect(page).not_to have_content @problem.message
end

Then(/^I should see the new message$/) do
  step "I should see the new problem"
end
