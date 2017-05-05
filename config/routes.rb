Rails.application.routes.draw do

    resources :users
    resources :tasks

    root 'sessions#new'

  get   'cadastroTarefas' =>  'tasks#new'
  get   'relatorios'  =>  'tasks#relatorios'
  get   'semanaAtual' =>  'tasks#semanaAtual'
  get    '/users' =>  'tasks#dashboard'
  get    'new_task' => 'tasks#new'
  get    'dashboard' => 'tasks#dashboard'
  get    'cadastroTarefas' => 'tasks#cadastroTarefas'
  get    'sign_in'   => 'sessions#new'
  post   'sign_in'   => 'sessions#create'
  post    'edit_tasks' => 'tasks#update'
  post   'new_task' =>  'tasks#create'
  delete 'sign_out'  => 'sessions#destroy'
end
