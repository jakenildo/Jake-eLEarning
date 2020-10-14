class UsersController < ApplicationController
  before_action :only_loggedin_users, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Sign-up Success!"
      redirect_to login_url
    else
      flash[:warning] = "Sign-up Failed"
      render 'new'
    end
  end


  def show
    @user = User.find(params[:id])
  end

  def index
    # @users = User.all

    @users = User.paginate(page:
      params[:page], per_page: 10 )
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
<<<<<<< HEAD
      flash[:success] = "Info Updated!"
      redirect_to @user
    else
      flash[:warning] = "Update Failed!"
=======
      redirect_to @user
    else
>>>>>>> 7461351... made settings page into update user
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email,:account_type, :password,
    :password_confirmation)
  end

  def only_loggedin_users
    redirect_to login_url unless logged_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?  (@user)
  end
end
