Given /^I have shows named "([^\"]*)" and "([^\"]*)"$/ do |name1, name2|
  Factory.create(:show, :name=>name1 )
  Factory.create(:show, :name=>name2 )
end

Given /^I have no shows$/ do
  Show.delete_all
end

Then /^I should have (\d+) (\w+)s?$/ do |count,klass|
    assert_equal count.to_i, klass.camelize.constantize.count
end

