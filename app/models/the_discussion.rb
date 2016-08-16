class TheDiscussion < ActiveRecord::Base
  has_many :posts
  validates_uniqueness_of :topic
end
