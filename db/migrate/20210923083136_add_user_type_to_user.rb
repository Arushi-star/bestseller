class AddUserTypeToUser < ActiveRecord::Migration[6.1]
  def change
  	add_column :users , :user_type_id , :integer
  end
end
