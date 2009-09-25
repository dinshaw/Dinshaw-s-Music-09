ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'public', :action => 'index'

  map.resource :user_session
  map.logout '/logout', :controller => 'user_sessions', :action => 'destroy'
  map.login '/login', :controller => 'user_sessions', :action => 'new'

  map.resources :users
  map.resource :account, :controller => "users"
  map.activate '/activate/:perishable_token', :controller => 'users', :action => 'activate', :perishable_token => nil
  # map.register '/register', :controller => 'users', :action => 'create'
  # map.signup '/signup', :controller => 'users', :action => 'new'
  map.unsubscribe '/unsubscribe', :controller => 'users', :action => 'unsubscribe'

  map.resources :songs, :recordings
  map.resources :notifications, :member => { :deliver => :post }

  map.namespace :admin do |admin|
    admin.resources :songs, :recordings, :recording_sessions, :notifications
  end

  SprocketsApplication.routes(map)

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action.:format'
  map.connect ':controller/:action/:id.:format'
  # catch for cms pages
  map.connect '/:action', :controller => "public"
end
