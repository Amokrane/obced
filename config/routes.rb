Obced::Application.routes.draw do
  devise_for :users 
  resources :users, :only => [:index, :show] do
    post 'vote_up'
  end
  resources :home
  resources :archives
  resources :codes do
    post 'vote_up'
    post 'vote_down'
    resources :comments
  end

  resources :tags do 
  	get 'related_tags', :on => :collection
  end

  root :to => "landings#index"
end
