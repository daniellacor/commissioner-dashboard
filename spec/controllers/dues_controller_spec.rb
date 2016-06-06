require 'rails_helper'

RSpec.describe DuesController do

  describe "POST pay" do
      it "will change a due's paid attribute to true after visiting"  do
        due = Due.create(amount: 20)
        post :pay
        expect(due.paid).to eq (true)
      end
    end

end
