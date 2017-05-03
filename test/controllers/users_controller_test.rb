require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	fixtures :users

	def test_new_user
		post :create, "user"=>{"name" => "Rafael", "email" => "rafael@hotmail.com", "job" => "Analista de Redes", "password" => "1234"}
		assert_not_nil assigns(:user)
		assert_redirected_to dashboard_url(:id => session[:user_id])
	end
end
