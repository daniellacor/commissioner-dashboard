class Commissioner < ActiveRecord::Base
  has_many :leagues
  has_many :managers, through: :leagues
end
