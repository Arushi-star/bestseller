class CheckoutController < ApplicationController 

	def create
        # find the product by the id
		product = Product.find(params[:id])

		if product.nil?
		   redirect_to root_path
		 return
		end	
		# setting the stripe session for payment

		@session = Stripe::Checkout::Session::create(
			payment_method_types: ['card'],
			line_items: [{
				name: product.name,
                description: product.description,
                amount: product.price,
                currency: 'usd',
                quantity: 1
                }],
                success_url: checkout_success_url,
                cancel_url: checkout_cancel_url
		)

		respond_to do |format|
			format.js
		end
	end

	def success
	end

	def cancel
	end
end 