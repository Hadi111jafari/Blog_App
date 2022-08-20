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
end
