Given /^the following (.*) records?$/ do |factory_name, table|
  table.hashes.each do|attrs|
    Factory.create(factory_name, attrs)
  end
end

Given /^I have ([\w_]+)s named "([^\"]*)" and "([^\"]*)"$/ do |model_name, name1, name2|
  Factory.create(model_name, :name=>name1 )
  Factory.create(model_name, :name=>name2 )
end

Given /^I have no ([\w_]+)s$/ do |klass|
  klass.camelize.constantize.delete_all
end

Then /^I should have (\d+) (\w+)s?$/ do |count,klass|
  assert_equal count.to_i, klass.singularize.camelize.constantize.count
end

When /^I (edit|delete) (\w+) (\d+)$/ do |action, klass, id|
  click_link "#{action}_#{klass}_#{id}"
end

Then /^(\w+) "([^\"]*)" should be selected$/ do |relation_name, label_value|
  response.should have_selector("select##{relation_name}_id option[selected='selected']") {|opt|
    opt.inner_text.should == label_value
  }
end

Then /^I should see the error "([^\"]*) ... ([^\"]*)" in the (.*) form$/ do |field_label, error_msg, klass|
  response.should have_selector("li##{klass}_#{field_label.titleize.gsub(/\s/,'').underscore}_input p.inline-errors") {|p|
    p.inner_text.should == error_msg
  }
end

