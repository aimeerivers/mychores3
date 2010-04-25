Then /^the email address for "([^\"]*)" should be "([^\"]*)"$/ do |login, email|
  User.find_by_login(login).email.should == email
end

