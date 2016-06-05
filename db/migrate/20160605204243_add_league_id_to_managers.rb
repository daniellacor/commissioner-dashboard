class AddLeagueIdToManagers < ActiveRecord::Migration
  def change
    add_column :managers, :league_id, :integer
  end
end
