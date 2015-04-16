class NegotiationsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_negotiation, only: [:edit, :update, :destroy]


	def edit
	end

	def create
		@negotiation = current_user.negotiations.new(negotiation_params)

		respond_to do |format|
			if @negotiation.save
				format.html { redirect_to sender_path(@negotiation.sender), notice: 'Negotiation was successfully created.' }
			else
				redirect_to sender_path(@negotiation.sender), notice: "Something went wrong"			
			end
		end
	end

	def update
		respond_to do |format|
			if @negotiation.update(negotiation_params)
				format.html { redirect_to sender_path(@negotiation.sender), notice: 'Negotiation was successfully updated.' }
				format.json { render :show, status: :ok, location: @sender }
			else
				redirect_to sender_path(@negotiation.sender), notice: "Something went wrong"
			end
		end
	end

	def destroy
		@negotiation.destroy
		respond_to do |format|
			format.html { redirect_to sender_path(@negotiation.sender), notice: 'Sender was successfully destroyed.' }
		end
	end

	private

	def set_negotiation
		@negotiation == Negotiation.find(params[:id])
	end

	def negotiation_params
		params.require(:negotiation).permit(:content, :sender_id)
	end

end