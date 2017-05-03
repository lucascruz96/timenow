require 'test_helper'

class UserTest < ActiveSupport::TestCase
	fixtures :users

	def test_new_user
		user = User.new(:name => "Vinicius", :email => "vinicius@hotmail.com", :job => "programador", :password => "1234")

		msg = "Não foi possivel inserir o usuário"
		
		assert user.save, msg

		user_lucas_copia = User.find_by(email: user.email)

		assert_equal user.name, user_lucas_copia.name
	end
end
