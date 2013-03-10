class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:sessions][:email].downcase)
  	if user.try(:authenticate, params[:sessions][:password])
      flash[:success] = "You are now signed in."
  		session[:user_id] = user.id
      redirect_to root_url
  	else
  		flash.now[:error] = "The provided email and password did not match with any user on record."
  		render 'new'
  	end
  end

  def destory

  end
end
