class Mailer < ActionMailer::Base
  default from: '"Creative Mons" <noreply@creativemons.be>'

  def notify_submission_to_author(entry)
    @entry = entry

    mail({
      :subject => "Votre article a été soumis : #{@entry.title}",
      :to      => @entry.author_email
    })
  end

  def notify_submission_to_user(entry, user)
    @entry = entry
    @user = user

    mail({
      :subject => "Un article a été posté sur Creative Mons : #{@entry.title}",
      :to      => @user.email
    })
  end

  def notify_comment_to_author(comment)
    @comment = comment
    @entry   = comment.entry

    mail({
      :subject => "Nouveau commentaire sur votre article : #{@entry.title}",
      :to      => @entry.author_email
    })
  end

  def notify_vote_to_author(vote)
    @vote  = vote
    @entry = vote.entry

    mail({
      :subject => "Nouveau vote sur votre article : #{@entry.title}",
      :to      => @entry.author_email
    })
  end
end
