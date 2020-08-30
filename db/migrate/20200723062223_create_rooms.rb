class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :number, unique: true
      t.integer :grade
      t.references :school, foreign_key:true
      t.timestamps
    end
  end
end