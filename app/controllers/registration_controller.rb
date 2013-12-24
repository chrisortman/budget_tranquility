class RegistrationController < ApplicationController
  def new

  end

  def create
  	u = User.new(params[:user])
  	if u.save
  		render :text => 'Hello'
  	else
  		redirect_to(register_url,notice: 'Missing required information')
  	end
  end

  private
  	# Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :new_password, :new_password_confirmation)
    end
end
