class RegistrationController < ApplicationController
  def new
    @user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to(login_url,notice: 'User created successfully, please log in')
  	else
  		render action: 'new'
  	end
  end

  private
  	# Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :new_password, :new_password_confirmation)
    end
end
