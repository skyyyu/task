Rails.application.routes.draw do
  devise_for :users
  resources :tasks
  resources :items
  
  post 'tasks/:id/state_plus_one' => 'tasks#state_plus_one'

  get 'pages/index'
  get 'pages' => 'pages#index'
  get 'monsters' => 'monster_model#index'
  get 'monsters/new' => 'monster_model#new'
  post 'monsters/create' => 'monster_model#create'
  get 'monsters/:id' => 'monster_model#show'
  get 'monsters/:id/edit' => 'monster_model#edit'
  patch 'monsters/update' => 'monster_model#update'
  post 'monsters/:id/destroy' => 'monster_model#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
