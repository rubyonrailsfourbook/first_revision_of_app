class ApplicationController < ActionController::Base
  before_filter :current_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    def find_posts
    if @current_post
      unless @current_post.admin?
        Post.where("published_at =< ?", Time.now.utc)
      else
        Post.all
      end
    else
      Post.all
    end
   end

  def current_user
    @current_user ||= User.find(session[:user_id]) unless session[:user_id].nil?
  end

  helper_method :current_user


end
