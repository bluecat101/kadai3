class AddProfileToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users,:introduction, :text
    add_index :users, :name,unique: true
  end

end
