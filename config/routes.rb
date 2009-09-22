ActionController::Routing::Routes.draw do |map|

  
  map.root :controller => 'public', :action => 'index'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :songs, :recordings
  map.resources :users

  map.unsubscribe '/unsubscribe', :controller => 'users', :action => 'unsubscribe'

  map.resource :session

  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil

  map.resources :users, :member => { :suspend   => :put, :unsuspend => :put, :purge => :delete }
  
  SprocketsApplication.routes(map) 
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action.:format'
  map.connect ':controller/:action/:id.:format'
  # catch for cms pages
  map.connect '/:action', :controller => "public"
end
