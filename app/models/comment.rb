class Comment < ActiveRecord::Base

  # Associations

  belongs_to :user
  belongs_to :entry

  # Validations

  validates :entry_id, :content, :presence => true

  def notify_entry_author
    #Mail::send('emails.authorEntryNewComment', [ 'entry' => $entry, 'comment' => $this ], function($message) use ($entry) {
    #  $subject = 'Nouveau commentaire sur votre article';
    #  $message->to($entry->author_email, $entry->author_name)
    #          ->subject($subject);
    #});
  end
end
