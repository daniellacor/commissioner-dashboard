class Commissioner < ActiveRecord::Base
  has_many :leagues
  has_many :managers, through: :leagues

  has_secure_password
  
end
