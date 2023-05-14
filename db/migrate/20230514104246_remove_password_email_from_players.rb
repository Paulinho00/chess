class RemovePasswordEmailFromPlayers < ActiveRecord::Migration[7.0]
  def change
    remove_column :players, :email, :string
    remove_column :players, :password, :string
  end
end
