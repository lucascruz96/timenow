require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  fixtures :tasks

	def test_new_task
		task = Task.new(:title => "Trabalho KDD", :description => "Trabalho a ser realizado para a disciplina de KDD", :spentTime => 6800, :id_category => 1, :id_user => 1)

		msg = "Não foi possivel inserir a tarefa"
		
		assert task.save, msg

		tarefa_copia = Task.find_by(title: task.title)

		assert_equal task.title, tarefa_copia.title
	end
end
