class EntriesController < ApplicationController
  def index
    @entries = Entry.published
  end

  def show
    if params[:voter_token]
      @voter   = User.find_by_token(params[:voter_token])
      @entry   = Entry.find(params[:id])
      @comment = Comment.new(:user => @voter, :entry => @entry)
    elsif params[:author_token]
      @author = true
      @entry  = Entry.find_by_token(params[:token])
    else
      @entry = Entry.find(params[:id])
    end
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(strong_params)

    if @entry.save
      Mailer.notify_submission_to_author(@entry).deliver
      User.all.each do |user|
        Mailer.notify_submission_to_user(@entry, user).deliver
      end
      render 'thanks'
    else
      render 'new'
    end
  end

  def vote_up
    @voter = User.find_by_token(params[:voter_token])
    @entry = Entry.find(params[:entry_id])

    if @vote = @entry.vote_up(@voter)
      Mailer.notify_vote_to_author(@vote).deliver
      redirect_to entry_path(@entry, :voter_token => params[:voter_token])
    end
  end

  def vote_down
    @voter = User.find_by_token(params[:voter_token])
    @entry = Entry.find(params[:entry_id])

    if @vote = @entry.vote_down(@voter)
      Mailer.notify_vote_to_author(@vote).deliver
      redirect_to entry_path(@entry, :voter_token => params[:voter_token])
    end
  end

  def strong_params
    params.require(:entry).permit(
      :kind,
      :title,
      :content,
      :start_date,
      :end_date,
      :author_name,
      :author_email,
      :url,
      :picture
    )
  end
end

