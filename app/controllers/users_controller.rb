class UsersController < ApplicationController
  before_action :set_user

  def show
    @posts = Post.includes(:user).order(created_at: :desc)
    @likes = Like.includes(:user).order(created_at: :desc)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
