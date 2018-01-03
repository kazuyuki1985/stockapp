Rails.application.routes.draw do

  resources :projects do
    resources :tasks, only: [:create, :destroy]
  end

  post '/projects/:project_id/tasks/:id/toggle' => 'tasks#toggle'

  root 'top#index'
  get 'top-index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
