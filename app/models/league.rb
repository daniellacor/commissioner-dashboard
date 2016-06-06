class League < ActiveRecord::Base
  belongs_to :commissioner
  has_many :managers
  has_one :due
end
