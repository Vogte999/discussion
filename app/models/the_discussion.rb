class TheDiscussion < ActiveRecord::Base
  validates_uniqueness_of :topic
end
