Rails.application.routes.draw do

  resources :projects do
    resources :tasks, only: [:create, :destroy]
  end

  post '/projects/:project_id/tasks/:id/toggle' => 'tasks#toggle'

  root 'projects#index'

  root 'notes#index'
  resources :notes

  get '/modes/switch' => 'projects#switch_mode', :as => 'switch_mode'

  get '/auth/:provider/callback' => 'login#callback'
  get '/logout' => 'login#logout', :as => 'logout'
  get '/oauth_failure' => 'login#oauth_failure'

  get 'user_store/:method' => 'user_store#call', :as => 'user_store'
  get 'note_store/:method' => 'note_store#call', :as => 'note_store'
  get 'advanced/:method' => 'advanced#call', :as => 'advanced'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
