class User < ActiveRecord::Base
  has_many :captions
end
