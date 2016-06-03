class AddNameAndEmailAndPhoneNumberToCommissioner < ActiveRecord::Migration
  def change
    add_column :commissioners, :name, :string
    add_column :commissioners, :email, :string
    add_column :commissioners, :phone_number, :string
  end
end
