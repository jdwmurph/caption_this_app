require '/Users/jdwmurph/code/wdi/projects/caption_this_app/app/validators/email_validator'

class User < ActiveRecord::Base
  has_many :captions
  has_many :images
  has_secure_password
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, email: true
end
