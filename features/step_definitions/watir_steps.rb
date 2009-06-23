Given /^I navigate to "([^\"]*)"$/ do |page_name|
  browser.goto("http://localhost:3001#{path_to(page_name)}")
end

Given /^I wait for the page to load$/ do
  browser.wait
end

Given /^I wait (\d+) seconds?$/ do |seconds|
  sleep seconds.to_i
end
 
Given /^I enter in "([^\"]*)" field "([^\"]*)"$/ do |field, value|
  browser.text_field(:id, field).set(value)
end

When /^I enter in "([^\"]*)" field "([^\"]*)" in the popup$/ do |field, value|
  cf_frame.text_field(:id, field).set(value)
end

When /^I enter in "([^\"]*)" value "([^\"]*)" in the popup$/ do |field_value, value|
  cf_frame.text_field(:value, field_value).set(value)
end

Given /^I select the "([^\"]*)" option from "([^\"]*)"$/ do |value, ddl|
  browser.select_list(:id, ddl).select(value)
end

Given /^I select the "([^\"]*)" option from "([^\"]*)" in the popup$/ do |value, ddl|
  cf_frame.select_list(:id, ddl).select(value)
end
 
Given /^I click the "([^\"]*)" button$/ do |but|
  browser.button(:value, but).click
  sleep 1
end

When /^I click the "([^\"]*)" button in the popup$/ do |button|
  cf_frame.button(:value, button).click
  sleep 1
end
 
Given /^I click the "([^\"]*)" link$/ do |lnk|
  link = browser.link(:text, lnk)
  link.click
  sleep 1
end

Given /^I click the "([^\"]*)" link in the popup$/ do |lnk|
  link = cf_frame.link(:text, lnk)
  link.click
  sleep 1
end
 
Given /^I click the link with id "([^\"]*)"$/ do |lnk|
  browser.link(:id, lnk).click
  browser.wait
end
 
Then /^I must see "([^\"]*)"$/ do |text|
  browser.text.gsub(/\n/, ' ').gsub(/\s+/, ' ').should include(text)
end

Then /^I must see "([^\"]*)" in the popup$/ do |text|
  cf_frame.text.gsub(/\n/, ' ').gsub(/\s+/, ' ').should include(text)
end
 
Then /^I must not see "([^\"]*)"$/ do |text|
  browser.text.gsub(/\n/, ' ').gsub(/\s+/, ' ').should_not include(text)
end
