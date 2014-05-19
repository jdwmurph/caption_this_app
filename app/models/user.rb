class User < ActiveRecord::Base
  has_many :captions
  has_many :images
end
