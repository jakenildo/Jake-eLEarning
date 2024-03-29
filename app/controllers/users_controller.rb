class UsersController < ApplicationController
  before_action :only_loggedin_users, only: [:index, :edit, :update, :destroy, :following, :followers]
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
      flash[:warning] = @user.errors.full_messages.to_sentence
      render 'new'
    end
  end


  def show
    @user = User.find(params[:id])
    @lesson = Lesson.where(user_id: params[:id])
    @learned_lesson = Lesson.where(user_id: @user.id, result: "Learned").count
    @activity = Activity.where(user_id: params[:id])
    @relationship = Relationship.where(follow_id: params[:id])
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10 )
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
      flash[:warning] = @user.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def destroy
    name = User.find(params[:id]).name
    User.find(params[:id]).destroy
    
    flash[:danger] = "Deleted user #{name} ! :'( "
    redirect_to users_url
  end

  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page], per_page: 6)
    @all_users = @user.followed_users
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 6)
    @all_users = @user.followers
    render 'show_follow'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email,:account_type, :password,
    :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?  (@user)
  end
end
