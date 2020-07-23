class CreateMonths < ActiveRecord::Migration[6.0]
  def change
    create_table :months do |t|
      t.string :month, null:false, unique: true
      t.timestamps
    end
  end
end
