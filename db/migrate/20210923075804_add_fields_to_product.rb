class AddFieldsToProduct < ActiveRecord::Migration[6.1]
  def change
  	add_column :products ,:color , :string
  	add_column :products , :price , :decimal
   end
end
