ActionController::Routing::Routes.draw do |map|

  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.resources :sessions
  
  map.refresh_piece 'piece/:id', :controller => 'pieces', :action => 'show'

  map.resources :works do |work|
    work.resources :pieces
  end

  map.resources :users

  map.root :controller => "sessions", :action => "new"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
