Mychores3::Application.routes.draw do

  # Sign up
  match '/sign-up' => 'profiles#new', :as => :sign_up, :via => :get
  match '/sign-up' => 'profiles#create', :as => :create_user, :via => :post

  # Sign in
  match '/sign-in' => 'user_sessions#new', :as => :sign_in, :via => :get
  match '/sign-in' => 'user_sessions#create', :as => :create_user_session, :via => :post
  match '/rpx' => 'user_sessions#create', :as => :rpx

  # Sign out
  match '/sign-out' => 'user_sessions#destroy', :as => :sign_out

  # Profile
  resource :profile, :as => :user, :only => [:edit, :update]

  # Teams
  resources :teams

  # Tasks
  resources :tasks

  root :to => 'home#index'
end
