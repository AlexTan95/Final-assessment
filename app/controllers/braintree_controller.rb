class BraintreeController < ApplicationController

	def new
		@client_token = Braintree::ClientToken.generate
	end

	def donation
	end

	def show
	end

	def checkout
		@amount = donation_params[:donation_amount]
		  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
		  result = Braintree::Transaction.sale(
		   :amount => @amount ,
		   :payment_method_nonce => nonce_from_the_client,
		   :options => {
		      :submit_for_settlement => true
		    }
		   )

		  if result.success?
		  	@project = Project.find(donation_params[:project_id])
		  	@project.update(current_fund: @amount.to_i + @project.current_fund)
		    redirect_to :root, :flash => { :success => "Transaction successful!" }
		  else
		    redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
		  end
	end

	private	

	def donation_params
		params.require(:checkout_form).permit(:donation_amount, :project_id)
	end
end
