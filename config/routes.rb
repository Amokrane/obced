Obced::Application.routes.draw do
  devise_for :users
  resources :archives
  resources :codes do
    post 'vote_up'
    resources :comments
  end

  resources :tags do 
  	get 'related_tags', :on => :collection
  end

  root :to => "codes#index"
end
