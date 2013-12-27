class SessionsController < ApplicationController
  def new
  end

  def create
    puts "Email: #{params[:email]}  Password: #{params[:password]}"

  	if user = User.authenticate(params[:email], params[:password])
  		session[:user_id] = user.id
  		redirect_to home_url
  	else
  		redirect_to({ :action =>:new }, alert: "Invalid username or password")
  	end

  end

  def destroy
  end

  
end
