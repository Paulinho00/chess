class RemoveGameId < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :game_id
  end
end
