module ApplicationHelper

	def currency_format(amount)
    if amount.present?
			decimal_amount = amount.to_s.split('.')
			if decimal_amount[1].to_i > 0
      	return number_to_currency(amount, :unit => "$ ",separator: ".",  :delimiter => ",")
    	else
       return number_to_currency(amount, :unit => "$ ",separator: ".",  :delimiter => ",", precision: 0)
		  end
    end
  end
end
