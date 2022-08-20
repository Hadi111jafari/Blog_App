class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    @comments = Comment.all
    @users = User.all
  end

  def show
    @post = Post.find(params[:id])
    @users = User.all
    @comments = Comment.all
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    post = Post.new(post_params)
    post.author_id = current_user.id

    if post.save
      redirect_to user_posts_path(current_user)
    else
      redirect_to new_user_post_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
