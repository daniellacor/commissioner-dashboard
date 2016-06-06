class Commissioner < ActiveRecord::Base
  has_many :leagues
  has_many :managers, through: :leagues
  has_one :due

  validates :name, presence: true

  has_secure_password

end
