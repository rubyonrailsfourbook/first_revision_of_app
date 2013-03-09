class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
  	if user.try(:authenticate, params[:session][:password])
  		session[:user_id] = user.id
  	else
  		flash.now[:error] = "The provided email and password did not match with any user on record."
  		render 'new'
  	end
  end

  def destory

  end
end
