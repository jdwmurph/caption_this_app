class Caption < ActiveRecord::Base
  belongs_to :user
  belongs_to :image
  acts_as_votable
end
