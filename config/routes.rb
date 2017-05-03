Rails.application.routes.draw do

  	resources :users
  	resources :tasks

  	root 'sessions#new'

  get		'cadastroTarefas'	=>	'tasks#new'
  get		'relatorios'	=>	'tasks#relatorios'
	get	   '/users'	=>	'tasks#dashboard'
  get	   'new_task' => 'tasks#new'
  post   'new_task' =>  'tasks#create'
	get	   'dashboard' => 'tasks#dashboard'
	get	   'cadastroTarefas' => 'tasks#cadastroTarefas'
	get    'sign_in'   => 'sessions#new'
	post   'sign_in'   => 'sessions#create'
	delete 'sign_out'  => 'sessions#destroy'
  post    'edit_tasks' => 'tasks#update'
end
