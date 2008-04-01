ActionController::Routing::Routes.draw do |map|
  map.resources :pages

  map.resources :roles

  map.resources :roles

	map.resources :users, :member => { :suspend   => :put,
                                     :unsuspend => :put,
                                     :purge     => :delete }
  
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.forgot_password '/forgot_password', :controller => 'users', :action => 'forgot_password'
  map.reset_password '/reset_password/:password_reset_code', :controller => 'users', :action => 'reset_password'
  map.change_password '/change_password', :controller => 'users', :action => 'change_password'
  
  map.resource :session  

  map.root :controller => "public"
  map.about_us "about_us", :controller => "public", :action => "about_us"
  map.contact_us "contact", :controller => "public", :action => "contact_us"
  map.jean_georges "jean_georges", :controller => "public", :action => "jean_georges"
  map.careers "careers", :controller => "public", :action => "careers"
        
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action.:format'
  map.connect ':controller/:action/:id.:format'
end
