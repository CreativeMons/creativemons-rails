class EntriesController < ApplicationController
  def index
    @entries = Entry.order('created_at DESC')
                    .published
                    .take(30)
  end

  def show
    if params[:voter_token]
      @vote    = Vote.find_by_token(params[:voter_token])
      @voter   = @vote.user
      @entry   = Entry.find(params[:id])
      @comment = Comment.new(:user => @voter, :entry => @entry)
      render
    elsif params[:author_token]
      @author = true
      @entry  = Entry.find_by_token(params[:author_token])
      render
    else
      @entry = Entry.find(params[:id])
      if @entry.published?
        render
      else
        redirect_to :root
      end
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
        vote = Vote.create!(:user => user, :entry => @entry)
        Mailer.notify_submission_to_user(@entry, user, vote).deliver
      end
      render 'thanks'
    else
      render 'new'
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

