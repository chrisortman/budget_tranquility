class SessionsController < ApplicationController
  def new
  end

  def create
  	if user = User.authenticate(params[:email], params[:password])
  		session[:user_id] = user.id
  		render :text => "Logged in"
  	else
  		redirect_to({ :action =>:new }, alert: "Invalid username or password")
  	end

  end

  def destroy
  end
end
