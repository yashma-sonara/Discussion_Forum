class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:comment))
		@comment.user_id = current_user.id if current_user
		

		if @comment.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	
	def edit
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
	end

	def update
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])

		if @comment.update(params[:comment].permit(:comment))
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end
	def delete
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to post_path(@comment.post), notice: 'Comment was successfully deleted.'
	end
	

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to post_path(@comment.post), notice: 'Comment was successfully deleted.'
	end
end