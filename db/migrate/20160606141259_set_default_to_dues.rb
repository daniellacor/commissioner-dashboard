class SetDefaultToDues < ActiveRecord::Migration
  def change
   change_column :dues, :paid, :boolean, default: false
  end
end
