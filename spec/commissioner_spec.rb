require 'rails_helper'

describe Commissioner do

  it "knows its name" do
    commissioner = Commissioner.new(name: "commissioner")
    expect(commissioner.name).to eq ("commissioner")
  end

  it "knows its email and that it's a real email address" do
    commissioner = Commissioner.new(email: "email@email.com")
    expect(commissioner.email).to eq ("email@email.com")
  end

  it "throws an error if email is not a real address" do
    commissioner = Commissioner.new(email: "invalidemail")
    commissioner.valid?
    commissioner.errors.should have_key(:email)
  end

  it "knows its phone number" do
    commissioner = Commissioner.new(phone_number: "phone number")
    expect(commissioner.phone_number).to eq ("phone number")
  end


end
