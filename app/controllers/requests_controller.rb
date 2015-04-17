class RequestsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_request, only: [:edit, :update, :destroy]

	def edit
	end

	def create
		@request = current_user.requests.new(request_params)

		respond_to do |format|
			if @request.save
				format.html { redirect_to receiver_path(@request.receiver), notice: 'Request was successfully created.' }
			else
				redirect_to receiver_path(@request.receiver), notice: "Something went wrong"			
			end
		end

		
	end

	def update
		respond_to do |format|
			if @request.update(request_params)
				format.html { redirect_to receiver_path(@request.receiver), notice: 'Request was successfully updated.' }
				format.json { render :show, status: :ok, location: @receiver }
			else
				redirect_to receiver_path(@request.receiver), notice: "Something went wrong"			
			end
		end
	end

	def destroy
		@request.destroy
		respond_to do |format|
			format.html { redirect_to receiver_path(@request.receiver), notice: 'Request was successfully destroyed.' }
			
		end
	end

	private

	def set_request
		@request = Request.find(params[:id])
	end

	def request_params
		params.require(:request).permit(:content, :receiver_id)
	end

end
