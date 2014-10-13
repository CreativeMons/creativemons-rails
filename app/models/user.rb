class User < ActiveRecord::Base

  # Associations

  has_many :comments
end
