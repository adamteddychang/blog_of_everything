class PostsController < ApplicationController
  before_action :current_user, only: %i[create]
  def index
    @user = User.find(params[:user_id])
    @posts_list = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def create
    new_post = current_user.posts.new(post_params)
    new_post.likes_counter = 0
    new_post.comments_counter = 0
    respond_to do |format|
      format.html do
        if new_post.save
          redirect_to "/users/#{new_post.user.id}/posts/", flash: { alert: 'Success! Post has been created!' }
        else
          render :new, flash.now[:error] = "Error, post couldn't be saved!"
          render action: 'new'
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    user = User.find(params[:user_id])
    user.posts_counter -= 1
    @post.destroy!
    user.save
    flash[:alert] = 'You have deleted this post!'
    redirect_to user_posts_path(user.id)
  end

  private

  def post_params
    params.require(:data).permit(:title, :text)
  end
end
