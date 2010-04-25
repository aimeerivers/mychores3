ActionController::Routing::Routes.draw do |map|

  # Sign up
  map.sign_up '/sign-up', :controller => 'users', :action => 'new', :conditions => {:method => :get}
  map.create_user '/sign-up', :controller => 'users', :action => 'create', :conditions => {:method => :post}

  # Sign in
  map.sign_in '/sign-in', :controller => 'user_sessions', :action => 'new', :conditions => {:method => :get}
  map.create_user_session '/sign-in', :controller => 'user_sessions', :action => 'create', :conditions => {:method => :post}

  # Sign out
  map.sign_out '/sign-out', :controller => 'user_sessions', :action => 'destroy'

  map.root :controller => 'home'
end
