class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = Comment.new(comments_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype_id)
    else
      render "prototypes/show"
    end
  end

  private
  def comments_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
