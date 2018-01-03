Rails.application.routes.draw do

  resources :notes
  get 'evernote/new'

  resources :projects do
    resources :tasks, only: [:create, :destroy]
  end

  post '/projects/:project_id/tasks/:id/toggle' => 'tasks#toggle'

  root 'projects#index'

  root 'evernote#index'
  resources :evernote

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
