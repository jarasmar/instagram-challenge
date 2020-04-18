class PostsController < ApplicationController

  def index
    @posts = Post.all.reverse
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    # displays the parameters for the post in the form
    # render plain: params[:post].inspect

    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      # si no cumple la validation (length > 5)
      # pasa el objeto de vuelta, tal y como estaba (render y no redirect)
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :text)
  end

end
