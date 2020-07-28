class CreateAbsentContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :absent_contacts do |t|
      t.date :arised_at, null: false
      t.integer :absent_kind, null: false
      t.text :reason, null: false
      t.references :room, null:false, foreign_key: true
      t.timestamps
    end
  end
end
