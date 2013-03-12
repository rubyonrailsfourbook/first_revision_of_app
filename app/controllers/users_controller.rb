class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def authors
    @users = User.where("admin is true")
  end

  def show
     @user = User.find(params[:id])
     @posts = @user.posts.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You are now signed up!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.update(user_params)
    if @user.update
      redirect_to root_url, flash: { success: "User was updated." }
    else
      render action: 'edit'
    end
  end

  def destory
    @user.destory
    redirect_to root_url, flash: { success: "User was destored." }
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
