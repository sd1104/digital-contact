class CreateRoomMonths < ActiveRecord::Migration[6.0]
  def change
    create_table :room_months do |t|
      t.references :room, null: false, foreign_key: true
      t.references :month, null: false, foreign_key: true
      t.timestamps
    end
  end
end
