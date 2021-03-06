class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to user_post_path(current_user.id, Post.find(params[:post_id])), flash: { alert: 'Comment created!' }
    else
      flash.now[:error] = "Error, couldn't save comment!"
      render action: new
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    post = Post.find(@comment.post_id)
    post.comments_counter -= 1
    @comment.destroy!
    post.save
    flash[:alert] = 'You have deleted this comment!'
    redirect_to user_post_path(current_user.id, post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
