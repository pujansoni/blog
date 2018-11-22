class PostsController < ApplicationController
	before_action :require_user

	def index
		@posts = @user.posts.where(user_id: @user)
	end

	def show
		@post = @user.posts.find(params[:id])
    @posts = @user.posts
  end

  def new
    @post = @user.posts.new
	end

	def edit
		@post = @user.posts.find(params[:id])
	end

	def create
		@post = @user.posts.new(post_params)
		# if @post.save
		# 	redirect_to user_post_path(@user, @post)
		# else
		# 	render 'new'
		# end
    @post.save
	end

	def update
		@post = @user.posts.find(params[:id])
		if @post.update(post_params)
      respond_to do |format|
        format.html { redirect_to user_post_path(@user, @post) }
        format.js {}
      end
		else
			render 'edit'
		end
	end

	def destroy
		@post = @user.posts.find_by(id: params[:id])
    respond_to do |format|
        format.html { redirect_to user_posts_path(@user) }
        format.js {}
    end
    @post.destroy
	end

  def like 
    
  end

	private

		def require_user
			@user = User.find(params[:user_id])
		end

		def post_params
			params.require(:post).permit(:message)
		end

end
