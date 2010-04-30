module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    when /the home\s?page/
      '/'

    when 'the sign-up page'
      sign_up_path

    when 'the sign in page'
      sign_in_path

    when 'the edit profile page'
      edit_user_path

    when 'the new team page'
      new_team_path

    when 'the new task page'
      new_task_path

    when /^the edit team page for "([^\"]*)"$/
      edit_team_path(Team.find_by_name($1))
    
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
