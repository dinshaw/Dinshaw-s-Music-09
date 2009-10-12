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
  map.unsubscribe '/unsubscribe.:format', :controller => 'users', :action => 'unsubscribe', :format => 'html'

  # needed for shared host messing up routes
  map.connect '/admin/recordings/autocomplete_song', :controller => 'admin/recordings', :action => 'autocomplete_song'
  
  map.namespace :admin do |admin|
    admin.resources :songs, :recordings, :recording_sessions, :notifications, :gigs, :venues, :addresses, :users, :comments, :cms_pages
  end
  
  map.resources :recordings, :recording_sessions, :notifications, :gigs, :venues, :addresses
  map.resources :songs, :has_many => :comments
  map.resources :notifications, :member => { :deliver => :post }
  map.privacy 'privacy', :controller => 'public', :action => 'privacy'
  map.contact 'contact', :controller => 'public', :action => 'contact'  
  SprocketsApplication.routes(map)

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action.:format'
  map.connect ':controller/:action/:id.:format'

end
