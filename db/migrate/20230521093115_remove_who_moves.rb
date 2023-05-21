class RemoveWhoMoves < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :who_moves
  end
end
