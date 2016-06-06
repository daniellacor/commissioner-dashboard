require 'rails_helper'

describe Due do

  it "has an amount" do
    due = Due.new(amount: 20)
    expect(due.amount).to eq (20)
  end

  it "by default, it is upaid upon creation" do
    due = Due.new(amount: 20)
    expect(due.paid).to eq (false)
  end

end
