class Manager < ActiveRecord::Base
  belongs_to :league
  has_one :due
end
