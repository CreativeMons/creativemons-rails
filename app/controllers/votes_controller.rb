class VotesController < ApplicationController
  def update
    @vote  = Vote.find_by_token(params[:id])
    @voter = @vote.user
    @entry = @vote.entry

    if @vote.update(strong_params)
      Mailer.notify_vote_to_author(@vote).deliver
      redirect_to entry_path(@entry, :voter_token => params[:id])
    end
  end

  def strong_params
    params.require(:vote).permit(:decision)
  end
end
