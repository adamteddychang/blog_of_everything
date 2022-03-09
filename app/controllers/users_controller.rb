class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all.order(created_at: :asc)
  end

  def show
    @user = User.find(params[:id])
    @list_post = @user.recent_3_posts
  end
end
