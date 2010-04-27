Given /^"([^\"]*)" is a member of team "([^\"]*)"$/ do |user, team|
  User.find_by_login(user).teams << Team.find_by_name(team)
end

Then /^"([^\"]*)" should be a member of team "([^\"]*)"$/ do |user, team|
  User.find_by_login(user).teams.include?(Team.find_by_name(team)).should be_true
end
