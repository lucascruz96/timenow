class SessionsController < ApplicationController
	before_action :block_access, except: [:destroy]
	
	def new
	end

	def create  
		@user = User.find_by(email: params[:session][:email].downcase, password: params[:session][:password])
		if @user
			sign_in(@user)
			redirect_to dashboard_url(:id => @user.id)
		else
			render action: :new
		end
	end
   
    def destroy
    	sign_out
    	redirect_to root_url
    end
end