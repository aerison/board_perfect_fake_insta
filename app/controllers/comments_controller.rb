class CommentsController < ApplicationController

  def create
    @comment = Post.find(params[:post_id]).comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save

    if @comment.save
    respond_to do |format|
      format.html{redirect_to :back}
      format.js{render 'create_temp'} #추가코드
    end
  else
    redirect_to :back
  end
end

  # def destroy
  #   @comment=Comment.find(params[:comment_id])
  #   @comment.destroy
  #   redirect_to :back
  # end
  def destroy
  @comment = Comment.find(params[:comment_id]) #comment_id
  @comment.destroy
  respond_to do |format|
    format.html {redirect_to :back}
    format.js {}
  end
end

  private
  def comment_params
    params.permit(:content)
  end
end
