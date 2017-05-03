require 'test_helper'

class TasksControllerTest < ActionController::TestCase
	fixtures :tasks

	def test_new_task
		post :create, "task"=>{"title" => "Tarefas de testes", "description" => "Realização de testes automaticos", "spentTime" => "0", "id_category" => "1"}
		assert_not_nil assigns(:task)
	
	end
end
