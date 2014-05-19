class Image < ActiveRecord::Base
  belongs_to :user
  has_many :captions
  acts_as_votable
end
