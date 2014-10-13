class Vote < ActiveRecord::Base

  # Associations

  belongs_to :user
  belongs_to :entry

  # PaperTrail

  has_paper_trail

  # Callbacks

  after_initialize :create_token

  private

  def create_token
    self.token ||= UUIDTools::UUID.random_create.to_s
  end
end
