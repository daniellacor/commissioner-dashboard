class Manager < ActiveRecord::Base
  has_one :due
  belongs_to :league
end
