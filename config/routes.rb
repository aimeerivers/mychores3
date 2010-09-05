Mychores3::Application.routes.draw do

  # Sign up
  match '/sign-up' => 'users#new', :as => :sign_up, :conditions => {:method => :get}
  match '/sign-up' => 'users#create', :as => :create_user, :conditions => {:method => :post}

  # Sign in
  match '/sign-in' => 'user_sessions#new', :as => :sign_in, :conditions => {:method => :get}
  match '/sign-in' => 'user_sessions#create', :as => :create_user_session, :conditions => {:method => :post}
  match '/rpx' => 'user_sessions#create', :as => :rpx

  # Sign out
  match '/sign-out' => 'user_sessions#destroy', :as => :sign_out

  # Profile
  resource :user, :as => :profile, :only => [:edit, :update]

  # Teams
  resources :teams

  # Tasks
  resources :tasks

  root :to => 'home#index'
end
