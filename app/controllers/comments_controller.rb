class CommentsController < ApplicationController
  def create
    @voter        = User.find_by_token(params[:voter_token])
    @comment      = Comment.new(strong_params)
    @comment.user = @voter

    if @comment.save
      Mailer.notify_comment_to_author(@comment).deliver
      redirect_to entry_path(@comment.entry, :voter_token => params[:voter_token])
    end
  end

  def strong_params
    params.require(:comment).permit(
      :entry_id,
      :content
    )
  end
end
