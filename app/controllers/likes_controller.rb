class LikesController < ApplicationController
  def create
    def create
      @post = Post.find(params[:post_id])
      @already_like = Like.find_by(ip: request.remote_ip, post_id: params[:post_id])
      if @already_like
        render 'posts/show'
      else
        @like = Like.create(post_id: params[:post_id], ip: request.remote_ip)
        redirect_to post_path(@post.id)
      end
    end
  end
end
