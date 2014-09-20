class Entry < ActiveRecord::Base

  # Carrierwave (image processing)

  mount_uploader :picture, PictureUploader

  # Associations

  has_many :comments
  has_many :votes

  # Callbacks

  after_initialize :create_token

  # Scopes

  def self.published
    all.select(&:published?)
  end

  # Methods

  def up_votes
    votes.where(:up => true)
  end

  def down_votes
    votes.where(:up => false)
  end

  def has_voted?(user)
    votes.where(:user_id => user.id).any?
  end

  def vote_up(user)
    vote(user, true)
  end

  def vote_down(user)
    vote(user, false)
  end

  def published?
    up_votes.count >= User.count / 3 && down_votes.count < User.count / 4
  end

  def as_json
    {
      :id          => id,
      :title       => title,
      :content     => content,
      :author_name => author_name,
      :kind        => kind,
      :path        => entry_path(self),
      :picture_url => picture.url('medium')
    }
  end

  private

  def vote(user, up)
    if not has_voted?(user)
      vote   = Vote.create!(:user => user, :up => up)
      votes << vote
    end

    return vote
  end

  def create_token
    self.token ||= UUIDTools::UUID.random_create.to_s
  end



#    public function __construct(array $attributes = array()) {
#      $this->hasAttachedFile('picture', [
#          'styles' => [
#            'large'  => '1140x550',
#            'medium' => '360x210#',
#            'thumb'  => '100x100'
#          ]
#      ]);
#      parent::__construct($attributes);
#    }
#
#    public function authorUrl() {
#      return URL::route('entries.showAsAuthor', array($this->token));
#    }
#
#    public function notifyAuthor() {
#      $entry = $this;
#
#      Mail::send('emails.authorEntrySubmitted', [ 'entry' => $entry ], function($message) use ($entry) {
#        $subject = 'Votre article a été soumis';
#        $message->to($entry->author_email, $entry->author_name)->subject($subject);
#      });
#    }
#
#    public function notifyUsers() {
#      $entry = $this;
#
#      foreach(User::all() as $user) {
#        Mail::send('emails.userEntrySubmitted', [ 'entry' => $entry, 'user' => $user ], function($message) use ($user, $entry) {
#          $subject = 'Action requise: un article a été posté sur Creative Mons';
#          $message->to($user->email, $user->name)
#                  ->subject($subject);
#        });
#      }
#    }

end
