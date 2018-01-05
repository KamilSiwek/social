class CommentsController < ApplicationController
  def create
    @pic = Pic.find(params[:pic_id])
    @comment = @pic.comments.create(params[:comment].permit(:commenter, :body))
    redirect_back fallback_location: root_path
  end

  def destroy
    @pic = Pic.find(params[:pic_id])
    @comment = @pic.comments.find(params[:id])
    @comment.destroy

    redirect_back fallback_location: root_path
  end
end
