class Image < ActiveRecord::Base
  belongs_to :user
  has_many :captions
  acts_as_votable
  validates :image_url, presence: true
end
