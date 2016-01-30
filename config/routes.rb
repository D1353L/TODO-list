Rails.application.routes.draw do

  root 'projects#index', as: :index
  post 'projects/create' => "projects#create", as: :create_project

  delete 'projects/delete' => "projects#delete", as: :delete_project
  put 'projects/update' => "projects#update", as: :update_project

  post 'tasks/add' => "tasks#add", as: :add_task
  put 'tasks/update' => "tasks#update", as: :update_task
  put 'tasks/change_status' => "tasks#change_status", as: :change_task_status
  delete 'tasks/delete' => "tasks#delete", as: :delete_task
  put 'tasks/sort' => "tasks#sort", as: :sort_tasks

end
