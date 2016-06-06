class Manager < ActiveRecord::Base
  has_one :due
  belongs_to :league
  has_one :due
end
