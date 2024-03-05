class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@posts = Post.all.order("created_at DESC")
		params[:tag] ? @posts = Post.tagged_with(params[:tag]) : @posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	
	
	def destroy
		puts "hh"
		@post = Post.find(params[:id])
		puts "Destroy action triggered for post with ID: #{params[:id]}"
		if @post.destroy
			redirect_to @root_path
		else 
			render 'delete'
		end
	end

	def delete
		@post = Post.find(params[:id])
		if @post.destroy
		  redirect_to root_path, notice: 'Post was successfully deleted.'
		else
		  redirect_to root_path, alert: 'Failed to delete post.'
		end
	  end
	  

	private

	def find_post
		puts "ff"
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
	end
end