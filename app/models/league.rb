class League < ActiveRecord::Base
  belongs_to :commissioner
  has_many :managers
end
