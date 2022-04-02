class PricingDetailsController < ApplicationController
  before_action :set_pricing_detail, only: %i[ show edit update destroy ]

  # GET /pricing_details or /pricing_details.json
  def index
    @pricing_details = PricingDetail.all
  end

  # GET /pricing_details/1 or /pricing_details/1.json
  def show
  end

  # GET /pricing_details/new
  def new
    @pricing_detail = PricingDetail.new
  end

  # GET /pricing_details/1/edit
  def edit
  end

  # POST /pricing_details or /pricing_details.json
  def create
    @pricing_detail = PricingDetail.new(pricing_detail_params)

    respond_to do |format|
      if @pricing_detail.save
        format.html { redirect_to pricing_detail_url(@pricing_detail), notice: "Pricing detail was successfully created." }
        format.json { render :show, status: :created, location: @pricing_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pricing_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pricing_details/1 or /pricing_details/1.json
  def update
    respond_to do |format|
      if @pricing_detail.update(pricing_detail_params)
        format.html { redirect_to pricing_detail_url(@pricing_detail), notice: "Pricing detail was successfully updated." }
        format.json { render :show, status: :ok, location: @pricing_detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pricing_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pricing_details/1 or /pricing_details/1.json
  def destroy
    @pricing_detail.destroy

    respond_to do |format|
      format.html { redirect_to pricing_details_url, notice: "Pricing detail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pricing_detail
      @pricing_detail = PricingDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pricing_detail_params
      params.require(:pricing_detail).permit(:base_price, :additional_amount, :discount_type, :tax_class, :vat_amount, :title_id)
    end
end
