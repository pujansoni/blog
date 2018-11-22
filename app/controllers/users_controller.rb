class UsersController < ApplicationController
  before_action :require_details, except: [:check_email]
  def check_email
    @user = User.find_by_email(params[:user][:email])
    respond_to do |format|
      format.json {
        render json: !@user
      }
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new 
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private 
    def user_params
      params.require(:user).permit(:user_name, :email, :date_of_birth, :contact_number, :address,
        :password, :password_confirmation, subcategory_ids: [])
    end

    def require_details
      @categories = Category.all;
    end
end
