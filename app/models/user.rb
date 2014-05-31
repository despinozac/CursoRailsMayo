class User < ActiveRecord::Base

  has_one :profile
  has_many :comments
end