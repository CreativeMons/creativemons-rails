class Comment < ActiveRecord::Base

  # Associations

  belongs_to :user
  belongs_to :entry

  # Validations

  validates :entry_id, :user_id, :content, :presence => true

end
