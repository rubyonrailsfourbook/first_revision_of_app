class CommentsController < ApplicationController
  def create
    @comment = @current_user.comments.build(comment_params)
    if @comment.save
      redirect_to :back, flash: { success: "Comment was updated." }
    else
    	params[:comment][:content] = params[:comment][:content]
      redirect_to :back, flash: { error: "There was an issue with your comment." }
    end
  end

  private

 	def comment_params
 		params.require(:comment).permit(:post_id, :comment)
 	end
end
