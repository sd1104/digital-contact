class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :number, null: false
      t.index :number, unique:true
      t.timestamps
    end
  end
end