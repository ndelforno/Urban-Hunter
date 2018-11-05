Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root "homepage#homepage"
resources :category do
  resources :hunt  do
    resources :task
    resources :comment
  end
end

  resources :user
  resources :sessions

end
