class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = current_user
  end

  def create
    comment = Comment.new(comment_params)
    comment.author_id = current_user.id
    comment.post_id = params[:post_id]

    if comment.save
      redirect_to user_posts_path(params[:user_id])
    else
      redirect_to new_user_post_comment
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
