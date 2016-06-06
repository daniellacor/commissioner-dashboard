class Commissioner < ActiveRecord::Base
  has_many :leagues
  has_many :managers, through: :leagues
  has_one :due

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: {:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, on: :create}

  has_secure_password

end
