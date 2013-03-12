class PostsController < ApplicationController
  def index
    @posts = find_posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "The post is now created"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.update(post_params, nil)
    if @post.update
      redirect_to root_url, flash: { success: "Post was updated." }
    else
      render action: 'edit'
    end
  end

  private

  	def post_params
  		params.require(:post).permit(:name, :content, :published_on)
  	end
end
