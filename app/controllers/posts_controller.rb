class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    # displays the parameters for the post in the form
    # render plain: params[:post].inspect

    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      # si no cumple la validation (length > 5)
      # pasa el objeto de vuelta, tal y como estaba (render y no redirect)
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

end
