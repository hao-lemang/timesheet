class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_parent_user!
  before_action :set_user, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, :authorize_parent_user!, only: [:new, :create]

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_time_sheets_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
end
