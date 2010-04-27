Given /^a team called "([^\"]*)"$/ do |name|
  Team.create!(:name => name)
end

Then /^there should be a team called "([^\"]*)"$/ do |name|
  Team.count(:conditions => {:name => name}).should == 1
end
