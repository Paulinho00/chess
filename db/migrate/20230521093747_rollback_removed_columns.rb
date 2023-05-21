class RollbackRemovedColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :games,:who_moves, :string, null: false
    add_column :games, :game_status, :string, null:false
  end
end
