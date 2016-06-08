class Manager < ActiveRecord::Base
  has_one :due
  belongs_to :league
  has_one :due

  validates_format_of :phone_number, :with =>  /\d[0-9]\)*\z/ , :message => "Please enter a valid phone number"

end
