class Vote < ActiveRecord::Base

  # Associations

  belongs_to :user
  belongs_to :entry

  # PaperTrail

  has_paper_trail

end
