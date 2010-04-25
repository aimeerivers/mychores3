ActionController::Routing::Routes.draw do |map|
  map.sign_up '/sign-up', :controller => 'users', :action => 'new', :conditions => {:method => :get}
  map.create_user '/sign-up', :controller => 'users', :action => 'create', :conditions => {:method => :post}
  map.root :controller => 'home'
end
