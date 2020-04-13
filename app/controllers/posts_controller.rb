class PostsController < ApplicationController

  def new
  end

  def create
    # displays the parameters for the post in the form
    # render plain: params[:post].inspect

    @post = Post.new(post_params)

    @post.save
    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

end
