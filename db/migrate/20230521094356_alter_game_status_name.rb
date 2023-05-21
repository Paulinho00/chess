class AlterGameStatusName < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :game_status, :string, null:false
    add_column :games, :status, :string, null:false
  end
end
