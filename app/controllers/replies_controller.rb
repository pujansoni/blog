class RepliesController < ApplicationController
  before_action :require_user

  def create
    @reply = @user.replies.new(reply_params)
    if @reply.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

    def require_user
      if @current_user == @user
        @user = User.find(params[:user_id])
      end
    end

    def reply_params
      params.require(:reply).permit(:replyable_id, :replyable_type, :message)
    end

end
