Rails.application.routes.draw do
  get 'welcome/index'

  root "welcome#index"


  resources :hunts do
    resources :tasks
    resources :comments
  end

  resources :categories
  resources :users
  resources :sessions

end
