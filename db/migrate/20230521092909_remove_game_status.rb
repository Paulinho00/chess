class RemoveGameStatus < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :status
  end
end
