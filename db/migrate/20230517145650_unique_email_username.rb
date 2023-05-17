class UniqueEmailUsername < ActiveRecord::Migration[7.0]
  def change
    add_index :players, :username, unique: true
  end
end
