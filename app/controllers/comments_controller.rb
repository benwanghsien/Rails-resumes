class CommentsController < ApplicationController
  def create
    @resume = Resume.published.friendly.find(params[:resume_id])
    @comment = @resume.comments.new(comment_params)

    if @comment.save
      redirect_to view_resume_path(@resume), notice: "留言成功"
    else
      flash.now[:alert] = "留言失敗"
      render "/resumes/view"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end
end