class AddPaidToDue < ActiveRecord::Migration
  def change
    add_column :dues, :paid, :boolean
  end
end
