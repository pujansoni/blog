class CommentsController < ApplicationController
  before_action :require_user_post 

  def new
    @comment = @post.comments.new
  end
  
  def create
    @comment = @post.comments.new(comment_params)
    # if @comment.save 
    #   redirect_back(fallback_location: user_posts_path(@user))
    # else
    #   flash[:now] = "Please enter valid comment"
    #   redirect_back(fallback_location: user_posts_path(@user))
    # end
    if @comment.save
      respond_to do |format|
        format.html { redirect_back(fallback_location: user_posts_path(@user)) }
        format.js 
      end
    else
      flash[:now] = "Please enter valid comment"
      redirect_back(fallback_location: user_posts_path(@user))
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
        format.html { redirect_to user_posts_path(@user) }
        format.js {}
    end
    @comment.destroy
  end

  private

    def require_user_post
      @user = User.find(params[:user_id])
      @post = @user.posts.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:text)
    end

end
