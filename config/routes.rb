Rails.application.routes.draw do
  get 'welcome/index'
  post '/hunts/:id/join' => "hunts#join", :as => 'hunt_join'
  post '/hunts/:id/unjoin' => "hunts#unjoin", :as => 'hunt_unjoin'
  post '/hunts/search', :as => 'hunt_search'
  patch '/users/:id/update_public' => "users#update_public", :as => 'users_profile'
  get '/welcome/team', :as => 'contact_us'
  get '/welcome/careers', :as => 'careers'
  get '/welcome/about', :as => 'about'

  root "welcome#index"


  resources :hunts do
    resources :tasks do
      resources :completed_tasks, only: [:new, :create]
    end
    resources :comments
  end

  resources :categories
  resources :users
  resources :sessions

end
