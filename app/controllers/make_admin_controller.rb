class MakeAdminController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user.update_attribute(:account_type,1)
    flash[:success] = "User: #{@user.name} is now an Admin! (^_^) "
    redirect_to users_url
  end

  def edit
    @user = User.find(params[:id])
    @user.update_attribute(:account_type,0)
    flash[:success] = "User: #{@user.name} is now an Normal User! (^_^) "
    redirect_to users_url
  end

end
