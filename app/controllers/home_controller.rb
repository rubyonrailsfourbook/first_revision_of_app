class HomeController < ApplicationController
  def index
  	@posts = find_posts
  end
end
