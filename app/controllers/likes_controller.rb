class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    if params[:likeable_type] == "Post"
      @post = Post.find(params[:likeable_id])
    else
      @comment = Comment.find(params[:likeable_id])
    end
    @like = Like.create( likeable_id: params[:likeable_id], likeable_type: params[:likeable_type], user_id: params[:user_id] )
    if @like.present?
      respond_to do |format|
        format.js 
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    if params[:likeable_type] == "Post"
      @post = Post.find(params[:likeable_id])
      @like = Like.find(params[:id])
      if @like.present?
        respond_to do |format|
            format.js {}
        end
      else
        redirect_back(fallback_location: root_path)
      end
      @like.destroy
    else
      @comment = Comment.find(params[:likeable_id])
      @like = Like.find(params[:id])
      if @like.present?
        respond_to do |format|
            format.js {}
        end
      else
        redirect_back(fallback_location: root_path)
      end
      @like.destroy
    end
  end

end
