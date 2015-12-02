Rails.application.routes.draw do

  root 'projects#index', as: :index
  post 'projects/create' => "projects#create", as: :create_project

  get 'projects/delete' => "projects#delete", as: :delete_project
  get 'projects/update' => "projects#update", as: :update_project

  post 'tasks/add' => "tasks#add", as: :add_task
  get 'tasks/update'
  get 'tasks/delete'

end
