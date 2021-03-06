class SendersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_sender, only: [:show, :edit, :update, :destroy]

  # GET /senders
  # GET /senders.json
  def index
    @senders = Sender.all
  end

  # GET /senders/1
  # GET /senders/1.json
  def show
    #@sender = Sender.find(params[:id])
    @negotiations = @sender.negotiations
    @negotiation = Negotiation.new

  end

  # GET /senders/new
  def new
    @sender = Sender.new
  end

  # GET /senders/1/edit
  def edit
    authorize! :manage, @sender
  end

  # POST /senders
  # POST /senders.json
  def create
    @sender = current_user.senders.new(sender_params)

    respond_to do |format|
      if @sender.save
        format.html { redirect_to @sender, notice: 'Sender was successfully created.' }
        format.json { render :show, status: :created, location: @sender }
      else
        format.html { render :new }
        format.json { render json: @sender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /senders/1
  # PATCH/PUT /senders/1.json
  def update
    authorize! :manage, @sender
    respond_to do |format|
      if @sender.update(sender_params)
        format.html { redirect_to @sender, notice: 'Sender was successfully updated.' }
        format.json { render :show, status: :ok, location: @sender }
      else
        format.html { render :edit }
        format.json { render json: @sender.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /senders/1
  # DELETE /senders/1.json
  def destroy
    authorize! :manage, @sender
    # ene lineiig nemev!
    @sender = Sender.find(params[:id])
    #
    @sender.destroy

    respond_to do |format|
      format.html { redirect_to senders_url, notice: 'Sender was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sender
      @sender = Sender.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sender_params
      params.require(:sender).permit(:source_address, :destination_address, :description, :arrival, :phone, :mail, :fee)
    end
end
