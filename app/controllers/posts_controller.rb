class PostsController < ApplicationController
  def create
    user = User.find_by(id: params[:user_id])
    if user
      post = user.posts.build(post_params)
      if post.save
        render json: { status: 'Post created successfully' }, status: :created
      else
        render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end
  
  def index
    posts = Post.all
    render json: { posts: posts }, status: :ok
  end
  
  def update
    post = Post.find_by(id: params[:id])
    if post
      if post.update(post_params)
        render json: { status: 'Post updated successfully' }, status: :ok
      else
        render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Post not found' }, status: :not_found
    end
  end
  
  def destroy
    post = Post.find_by(id: params[:id])
    if post
      post.destroy
      render json: { status: 'Post deleted successfully' }, status: :ok
    else
      render json: { error: 'Post not found' }, status: :not_found
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:content)
  end
end
