class Product < ApplicationRecord
	belongs_to :user 
 
	has_many_attached :images, dependent: :destroy

	enum category_types: { clothing: 0 , mobile: 1 , bakery: 3 , electronics: 4 , furniture: 5 }

	has_many :favourites,dependent: :destroy
end
 