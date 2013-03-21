class ApplicationController < ActionController::Base
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
end
