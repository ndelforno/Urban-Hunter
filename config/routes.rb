Rails.application.routes.draw do
  get 'welcome/index'
  post '/hunts/:id/join' => "hunts#join", :as => 'hunt_join'
  post '/hunts/:id/unjoin' => "hunts#unjoin", :as => 'hunt_unjoin'
  get '/hunts/search', :as => 'hunt_search'
  patch '/users/:id/update_public' => "users#update_public", :as => 'users_profile'

  root "welcome#index"


  resources :hunts do
    resources :tasks
    resources :comments
  end

  resources :categories
  resources :users
  resources :sessions

end

# <%if participant.id == current_user.id %>
#   <p>| <%= link_to('Leave this hunt', hunt_join_path, method: :post, data: {confirm: "Are you sure you want to delete this hunt?"})%></p>
# <% end %>
