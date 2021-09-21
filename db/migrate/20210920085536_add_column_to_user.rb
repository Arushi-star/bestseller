class AddColumnToUser < ActiveRecord::Migration[6.1]
  def change
  	add_column :users, :name ,:string
  	add_column :users, :phonenumber ,:bigint
  end
end
