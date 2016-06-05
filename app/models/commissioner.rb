class Commissioner < ActiveRecord::Base
  has_many :leagues
  has_many :managers, through: :leagues

  has_secure_password

  def validate_email
    if email !~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      errors.add(:email, "is not an email")
    end
  end

end
