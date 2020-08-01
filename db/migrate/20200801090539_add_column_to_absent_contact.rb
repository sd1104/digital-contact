class AddColumnToAbsentContact < ActiveRecord::Migration[6.0]
  def change
    add_column :absent_contacts, :t_checked, :boolean, default:false, null:false
  end
end
