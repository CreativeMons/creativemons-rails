class Vote < ActiveRecord::Base

  # Associations

  belongs_to :user
  belongs_to :entry

#  public function notifyAuthor() {
#    $entry = $this->entry;
#
#    Mail::send('emails.authorEntryNewVote', [ 'entry' => $entry ], function($message) use ($entry) {
#      $message->to($entry->author_email, $entry->author_name)
#              ->subject('Nouveau vote : ' . $entry->title);
#    });
#  }
#

end
