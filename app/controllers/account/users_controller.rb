class Account::UsersController < ApplicationController

before_action :authenticate_user!

  def show
    @users1=current_user.followed_users.paginate(:page => params[:page], :per_page => 10) #关注当前用户的所有用户
    @users2=current_user.followers.paginate(:page => params[:page], :per_page => 10)#当前用户关注的所用用户
  end


end
