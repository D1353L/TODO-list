Rails.application.routes.draw do

  root 'projects#index', as: :index
  post 'projects/create' => "projects#create", as: :create

  get 'projects/delete' => "projects#delete", as: :delete
  get 'projects/update' => "projects#update", as: :update

  get 'tasks/add'
  get 'tasks/update'
  get 'tasks/delete'

end
