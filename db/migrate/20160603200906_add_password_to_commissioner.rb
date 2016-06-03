class AddPasswordToCommissioner < ActiveRecord::Migration
  def change
    add_column :commissioners, :password_digest, :string
  end
end
