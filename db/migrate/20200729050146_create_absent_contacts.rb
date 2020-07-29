class CreateAbsentContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :absent_contacts do |t|
      t.date :absent_at, null:false
      t.integer :kind, null: false
      t.text :reason, null: false
      t.boolean :after_contact, null:false
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
