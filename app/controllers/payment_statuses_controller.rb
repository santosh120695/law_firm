class PaymentStatusesController < ApplicationController
  before_action :set_payment_status, only: %i[ show edit update destroy ]
  layout "pdf", only: %i[bill]

  # GET /payment_statuses or /payment_statuses.json
  def index
    @payment_statuses = PaymentStatus.all
  end

  def bill 
    @item = params[:item_type].constantize.find_by(uuid: params[:item])
    @payment_statuses = @item.payment_statuses

  end

  # GET /payment_statuses/1 or /payment_statuses/1.json
  def show
  end

  # GET /payment_statuses/new
  def new
    @payment_status = PaymentStatus.new
  end

  # GET /payment_statuses/1/edit
  def edit
  end

  # POST /payment_statuses or /payment_statuses.json
  def create
    @payment_status = PaymentStatus.new(payment_status_params)
    @payment_status.title_id = params[:title_id]
    respond_to do |format|
      if @payment_status.save!
        format.html { redirect_to "/#{@payment_status.item_type.pluralize.downcase}/#{@payment_status.item.uuid}", notice: "Payment status was successfully created." }
        format.json { render :show, status: :created, location: @payment_status }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_statuses/1 or /payment_statuses/1.json
  def update
    respond_to do |format|
      if @payment_status.update(payment_status_params)
        format.html { redirect_to payment_status_url(@payment_status), notice: "Payment status was successfully updated." }
        format.json { render :show, status: :ok, location: @payment_status }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_statuses/1 or /payment_statuses/1.json
  def destroy
    @payment_status.destroy

    respond_to do |format|
      format.html { redirect_to payment_statuses_url, notice: "Payment status was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_status
      @payment_status = PaymentStatus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_status_params
      params.require(:payment_status).permit(:payment_mode_id, :payment_detail, :amount, :uuid, :item_type, :item_id)
    end
end
