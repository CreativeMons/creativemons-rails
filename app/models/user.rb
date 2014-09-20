class User < ActiveRecord::Base

  # Associations

  has_many :comments

  # Callbacks

  after_initialize :create_token

  private

  def create_token
    self.token ||= UUIDTools::UUID.random_create.to_s
  end
end
