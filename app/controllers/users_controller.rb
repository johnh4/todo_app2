class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  def create
  	@user = User.new(user_params)
  	if @user.save
  		cookies[:auth_token] = @user.auth_token
  		flash[:success] = "Signed up successfully."
		redirect_to tasks_path
  	else
  		flash[:notice] = "Signup error, try again."
  		render 'new'
  	end
  end


  private

  	def user_params
  		params.require(:user).permit(:email, :password, :password_confirmation)
  	end
end
