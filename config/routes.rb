Rails.application.routes.draw do
  get 'completed_task/index'
  get 'completed_task/new'
  get 'completed_task/create'
  get 'completed_task/edit'
  get 'completed_task/update'
  get 'completed_task/delete'
  get 'category/index'
  get 'category/new'
  get 'category/create'
  get 'category/edit'
  get 'category/update'
  get 'category/delete'
  get 'participation/index'
  get 'participation/new'
  get 'participation/create'
  get 'participation/edit'
  get 'participation/update'
  get 'participation/delete'
  get 'session/new'
  get 'session/create'
  get 'session/delete'
  get 'comment/index'
  get 'comment/new'
  get 'comment/create'
  get 'comment/show'
  get 'comment/edit'
  get 'comment/update'
  get 'comment/delete'
  get 'task/index'
  get 'task/new'
  get 'task/create'
  get 'task/show'
  get 'task/edit'
  get 'task/update'
  get 'task/delete'
  get 'hunt/index'
  get 'hunt/new'
  get 'hunt/create'
  get 'hunt/show'
  get 'hunt/edit'
  get 'hunt/delete'
  get 'user/show'
  get 'user/create'
  get 'user/edit'
  get 'user/delete'
  get 'user/new'
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
