class Vote < ActiveRecord::Base

  # Associations

  belongs_to :user
  belongs_to :entry

end
