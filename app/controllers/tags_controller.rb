class TagController < ApplicationController
	before_filter :find_tag

	def index
		@tags = Tag.order(:name)
		respond_to do|format|
			format.json { render json: @tags.tokens(params[:q])}
		end
	end



	private
		def find_tag
			@tag = Tag.find(params[:id]) if params[:id]
		end
end