class AddStatusToUserType < ActiveRecord::Migration[6.1]
  def change
  	add_column :user_types , :status , :boolean, :default => true
  end
end
