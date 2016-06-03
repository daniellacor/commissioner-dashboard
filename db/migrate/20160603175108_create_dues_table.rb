class CreateDuesTable < ActiveRecord::Migration
  def change
    create_table :dues do |t|
      t.integer :amount
      t.integer :league_id
      t.integer :manager_id
      t.integer :commissioner_id
    end
  end
end
