Obced::Application.routes.draw do
  match '/auth/:provider/callback' => 'authentications#create'
  resources :authentications
  devise_for :users, :controllers => {:registrations => 'registrations'}
  resources :users, :only => [:index, :show] do
    post 'vote_up'
  end
  resources :home
  resources :archives
  resources :codes do
    post 'vote_up'
    post 'vote_down'
    post 'share_by_email'
    get 'import_gist', :on => :collection
    resources :comments
  end

  resources :tags do 
  	get 'related_tags', :on => :collection
  end

  root :to => "landings#index"
end
