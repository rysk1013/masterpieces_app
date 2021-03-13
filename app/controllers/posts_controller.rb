class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.includes(:user).order(created_at: :desc)
    @likes = Like.includes(:post)
    @tag_list = Tag.includes(:post)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    tag_list = params[:post][:tag_name].split(nil)
    if @post.save
      @post.save_tag(tag_list)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @already_like = Like.find_by(post_id:params[:id], ip: request.remote_ip)
    @likes = Like.includes(:user)
    @post_tags = @post.tags
  end

  def edit
  end

  def update
    tag_list = params[:post][:tag_name].split(nil)
    if @post.update(post_params)
      @post.save_tag(tag_list)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:image, :title, :overview, :programming_languages, :techs, :portfolio_url, :github_url).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
