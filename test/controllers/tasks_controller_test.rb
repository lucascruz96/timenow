require 'test_helper'

class TasksControllerTest < ActionController::TestCase
	fixtures :tasks

	def test_new_task
		post :create, "task"=>{"title" => "Tarefas de testes", "description" => "Realização de testes automaticos", "spentTime" => "0", "date" => "2017-05-21", "id_category" => "1"}
		assert_not_nil assigns(:task)	
	end

	def test_calc_proporcao_true
		@resultado = @controller.calc_proporcao(100, 5)

		assert_equal @resultado, 5
	end

	def test_calc_proporcao_false
		@resultado = @controller.calc_proporcao(100, 100)

		assert_not_equal @resultado, 7
	end

end
