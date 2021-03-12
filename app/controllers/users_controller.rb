class UsersController < ApplicationController
  def show
    @user = current_user
    @posts = Post.includes(:user).order(created_at: :desc)
  end
end
