
class PostsController < ApplicationController
	 layout "product", :only =>:index
	def index




		@posts=Post.paginate(:page => params[:page], :per_page => 4)
#@posts = Post.all

#respond_to do |format|
#@posts = @posts.paginate(:page => params[:page], :per_page => 10) 
#format.html # index.html.erb
#format.json { render json: @posts }
#end
	end
	def show
		@post=Post.find(params[:id])
	end
	def new
		@post=Post.new
	end
	def create
		@post=Post.new(params[:post])

		if @post.save
			redirect_to posts_path,:notice =>"Your post was saved."
		else
			redirect_to posts_path, :notice =>"Error! Re-create your post please.";
		end
		
	end
	def edit
		@post=Post.find(params[:id])
	end
	def update
		@post=Post.find(params[:id])

		if @post.update_attributes(params[:post])
			redirect_to posts_path,:notice =>"Your post has been updated."
		else
			render "edit"
		end
	end
	def destroy
		@post=Post.find(params[:id])
		@post.destroy
			redirect_to posts_path,:notice =>"Your post has been deleted."
	end
end
