class CreateContactBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_books do |t|

      t.timestamps
    end
  end
end
