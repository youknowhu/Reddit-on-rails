class CommentsController < ApplicationController
  before_action :require_logged_in

  def new
    # @comment = Comment.new
    # @comment.author_id = current_user.id
    # @comment.post_id = params[:post_id]
    #
    # render :new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id

    if @comment.save
      redirect_to comment_url(@comment)
    else
      flash[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
    render :show
  end

  private

  def comment_params
    params.require(:comment).permit(:content,
      :author_id, :post_id, :parent_comment_id)
  end
end
