class UsersController < ApplicationController
	before_action :authorize, except: [:new, :create]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
      	sign_in(@user)
     	redirect_to dashboard_url(:id => @user.id)
  		else 
  			render action: :new
  		end
  	end

  	def index
  		@users = User.all
  	end


  	private
  	def user_params
  		params.require(:user).permit(:name, :email, :job, :password)
  	end
end
