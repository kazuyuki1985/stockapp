class AddColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :user_id, :integer
    add_column :notes, :user_id, :integer
    add_index :projects, :user_id
    add_index :notes, :user_id
  end
end