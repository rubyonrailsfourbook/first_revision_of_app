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
        respond_to do |format|
          format.html # index.rhtml
          format.xml { render :xml => @posts.to_xml }
      end
    else
      Post.all
    end
   end
end
