class CreateContactBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_books do |t|
      t.datetime :date
      t.integer :letter
      t.text :bring
      t.text :schedule
      t.text :homework
      t.text :inform
      t.references :room, null:false, foreign_key: true
      t.timestamps
    end
  end
end


