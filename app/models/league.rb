class League < ActiveRecord::Base
  belongs_to :commissioner
  has_many :managers
  has_many :dues

  def amount_paid
    if self.commissioner.due
      paid = self.dues.select {|due| due.paid }.count
      total = (self.commissioner.due.amount * paid)
    else
      total = 0
    end
    total
  end
end
