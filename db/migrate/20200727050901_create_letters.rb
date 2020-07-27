class CreateLetters < ActiveRecord::Migration[6.0]
  def change
    create_table :letters do |t|
      t.datetime :released_at, null: false
      t.string :name, null:false
      t.string :pdf, null:false
      t.references :room, null:false, foreign_key: true
      t.timestamps
    end
  end
end
