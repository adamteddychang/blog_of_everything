class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :asc)
  end

  def show
    @user = User.find(params[:id])
    @list_post = @user.recent_3_posts
  end

  def apitoken
    @user = User.find(params[:id])
    render json: @user.apitoken, status: :ok
  end
end
