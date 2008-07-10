ActionController::Routing::Routes.draw do |map|
  map.resources :subscribers

    ## admin part
    map.namespace :admin do |admin|
        admin.resource  :account

        admin.resources :editable_areas

        admin.resources :pages

        admin.resource  :session

        admin.root :controller => 'index'
    end

    ## public part
   # map.root :controller => 'index'
    map.root :controller => 'subscribers', :action =>'new'
    
    map.resource :subscriber

    # should have lowest priority
    map.pages '*url', 
        :controller => 'pages', :action => 'show'


end
