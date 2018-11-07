Rails.application.routes.draw do
  get 'welcome/index'
  get 'hunts' => 'hunts#index'
  get 'hunts/new' =>'hunts#new'
  post 'hunts/create' => 'hunts#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root "welcome#index"


resources :categories do
  resources :hunts do
    resources :tasks
    resources :comments
  end
end

  resources :users
  resources :sessions

end
