class PostsController < ApplicationController
  before_filter :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = find_post
  end

  def show
    @comment = @current_user.comments.new
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
    @post = Post.find params[:id]
  end

  def update
    @post = Post.update(params[:id], post_params)
    if @post.update
      redirect_to root_url, flash: { success: "Post was updated." }
    else
      render action: 'edit'
    end
  end

  private

  	def post_params
  		params.require(:post).permit(:name, :content, :published_on, :tag_list)
  	end

    def set_post
      @post = Post.find(params[:id])
    end
end
