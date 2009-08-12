Given /^I have ([\w_]+)s named "([^\"]*)" and "([^\"]*)"$/ do |model_name, name1, name2|
  Factory.create(model_name, :name=>name1 )
  Factory.create(model_name, :name=>name2 )
end

Given /^I have no ([\w_]+)s$/ do |klass|
  klass.camelize.constantize.delete_all
end

Then /^I should have (\d+) (\w+)s?$/ do |count,klass|
    assert_equal count.to_i, klass.camelize.constantize.count
end

