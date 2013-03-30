class CommentController < ApplicationController
	# before_filter :find_comment, only: [:show, :edit, :update, :destory]
	def new
		@post = Post.new(parent_id: params[:parent_id])
	end



	private
		def find_comment
			@comment = Comment.find(params[:id]) if params[:id]
		end
end