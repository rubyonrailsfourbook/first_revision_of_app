class HomeController < ApplicationController
  def index
  	@posts = find_posts
  	@tags = Tag.all
  end
end
