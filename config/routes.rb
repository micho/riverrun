ActionController::Routing::Routes.draw do |map|

  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.resources :sessions
  
  map.refresh 'refresh/:mode/:id', :controller => 'pieces', :action => 'refresh'

  map.resources :works do |work|
    work.resources :pieces
  end

  map.resources :users

  map.root :controller => "sessions", :action => "new"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
