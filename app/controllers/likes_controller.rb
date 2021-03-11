class LikesController < ApplicationController
  before_action :set_post
  before_action :set_already_like

  def create
    if @already_like
      render 'posts/show'
    else
      @like = Like.create(post_id: params[:post_id], ip: request.remote_ip)
      redirect_to post_path(@post.id)
    end
  end

  def destroy
    @already_like.destroy
    redirect_to post_path(@post.id)
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_already_like
    @already_like = Like.find_by(ip: request.remote_ip, post_id: params[:post_id])
  end
end
