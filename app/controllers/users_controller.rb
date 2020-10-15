class UsersController < ApplicationController
  before_action :only_loggedin_users, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
<<<<<<< HEAD
      flash[:success] = "Sign-up Success!"
=======
>>>>>>> f79a2f2481b621f8a99f1cd3d565d7a1a1ee19bc
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
      flash[:success] = "Info Updated!"
      redirect_to @user
    else
      flash[:warning] = "Update Failed!"
      render 'edit'
    end
  end

  def destroy
    name = User.find(params[:id]).name
    User.find(params[:id]).destroy
    
    flash[:danger] = "Deleted user #{name} ! :'( "
    redirect_to users_url
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
