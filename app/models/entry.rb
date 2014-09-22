class Entry < ActiveRecord::Base

  # Enumerize

  extend Enumerize

  enumerize :kind, :in    => [:article, :event],
                   :scope => true

  # Carrierwave (image processing)

  mount_uploader :picture, PictureUploader

  # Associations

  has_many :comments
  has_many :votes

  # Validations

  validates :kind, :title, :content, :author_name,
            :author_email, :url, :picture,
            :presence => true

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
end
