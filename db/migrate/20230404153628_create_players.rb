class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :player_id, {index: true, null: false}
      t.string :email, {null: false}
      t.string :username, {null: false}
      t.string :password, {null: false}

      t.timestamps
    end
  end
end
