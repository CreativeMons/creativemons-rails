class Entry < ActiveRecord::Base

  # Enumerize

  extend Enumerize

  enumerize :kind, :in    => [:article, :event],
                   :scope => true

  # Carrierwave (image processing)

  mount_uploader :picture, PictureUploader

  # PaperTrail

  has_paper_trail

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

  def accept_votes
    votes.all.select { |vote| vote.decision == 'accept' }
  end

  def reject_votes
    votes.all.select { |vote| vote.decision == 'reject' }
  end

  def waiting_votes
    votes.all.select { |vote| vote.decision == 'none' }
  end

  def has_voted?(user)
    votes.where(:user_id => user.id).decision != 'none'
  end

  def published?
    num_votes  = votes.count
    num_accept = accept_votes.count
    num_reject = reject_votes.count

    num_accept >= num_votes / 3 && num_reject < num_votes / 4
  end

  private

  def create_token
    self.token ||= UUIDTools::UUID.random_create.to_s
  end
end
