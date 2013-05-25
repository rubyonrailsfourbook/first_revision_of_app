class CommentsController < ApplicationController
  def new
  	@comment = @current_user.comments.build(parent_id: params[:parent_id])
  end

  def create
    @comment = @current_user.comments.build(comment_params)
    if @comment.save!
      redirect_to :back, flash: { success: "Comment was updated." }
    else
      redirect_to :back, flash: { error: "There was an issue with your comment." }, comment: { content: params[:comment][:content] }
    end
  end

  private

 	def comment_params
 		params.require(:comment).permit(:post_id, :content)
 	end
end
