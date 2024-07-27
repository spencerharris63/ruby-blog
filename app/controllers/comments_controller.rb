class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def create
    if @post.comments.create(comment_params)
      redirect_to @post, notice: 'Comment was successfully created you dawg.'
    else
      redirect_to @post, alert: 'Damn dawg, you didnt create the comment correctly'
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post), notice: 'Comment was successfully deleted.'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:author, :body, :email)
  end
end