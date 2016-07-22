class Post < ActiveRecord::Base
  has_one :user
  has_one :the_discussion
  validates_uniqueness_of :text
end
