class UsersController < ApplicationController
  before_action :set_user
  before_action :access_restriction, only: [:edit, :update, :destroy]

  def show
    @posts = Post.includes(:user).order(created_at: :desc)
    @likes = Like.includes(:user).order(created_at: :desc)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def access_restriction
    if current_user.id != @user.id
      redirect_to root_path
    end
  end
end
