Then /^I (should|should not) be signed in$/i do |should_or_not|
  method = should_or_not == 'should' ? :should : :should_not
  page.send(method, have_css('a#sign-out'))
end

Given /^a registered user called "([^\"]*)"$/ do |login|
  create_user(login)
end

Given /^a registered user called "([^\"]*)" with password "([^\"]*)"$/ do |login, password|
  create_user(login, password)
end

Given /^I am signed in as a user called "([^\"]*)"$/ do |login|
  user = create_user(login)
  sign_in_as(user)
end

Given /^I am a new visitor$/ do
  # TODO: implement, nothing to do yet
end

Then /^I should find a form that allows me to sign up$/ do
  page.should have_css('form#sign-up')
end

Then /^I should find a form that allows me to sign in$/ do
  page.should have_css('form#sign-in')
end

private

def create_user(login, password='passw0rd')
  user = User.find_by_login(login)
  return user if user

  User.create!(:login => login,
               :email => "#{login}@test.com",
               :password => password,
               :password_confirmation => password)
end

def sign_in_as(user)
  post user_session_path, :user_session => {:login => user.login, :password => user.password}
  response.should be_redirect
end
