class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    
    if @post.save
      redirect_to posts_path, notices: 'Post created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
