class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :the_discussion
  validates_uniqueness_of :text
end
