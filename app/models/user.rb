class User < ActiveRecord::Base
  has_many :captions
  has_many :images
  has_secure_password
end
