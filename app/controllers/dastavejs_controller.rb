class DastavejsController < ApplicationController
  before_action :set_dastavej, only: %i[ show edit update destroy dastavej_status_update ]
  skip_before_action :verify_authenticity_token

  # GET /dastavejs or /dastavejs.json
  def index
    @dastavejs = Dastavej.all
  end

  # GET /dastavejs/1 or /dastavejs/1.json
  def show
  end

  # GET /dastavejs/new
  def new
    @dastavej = Dastavej.new
    @dastavej.build_dastavej_pricing_detail
  end

  # GET /dastavejs/1/edit
  def edit
  end

  # POST /dastavejs or /dastavejs.json
  def create
    @dastavej = Dastavej.new(dastavej_params)
    respond_to do |format|
      if @dastavej.save!
        format.html { redirect_to dastavej_url(id: @dastavej.uuid), notice: "Dastavej was successfully created." }
        format.json { render :show, status: :created, location: @dastavej }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dastavej.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dastavejs/1 or /dastavejs/1.json
  def update
    respond_to do |format|
      if @dastavej.update(dastavej_params)
        format.html { redirect_to dastavej_url(@dastavej), notice: "Dastavej was successfully updated." }
        format.json { render :show, status: :ok, location: @dastavej }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dastavej.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dastavejs/1 or /dastavejs/1.json
  def destroy
    @dastavej.destroy

    respond_to do |format|
      format.html { redirect_to dastavejs_url, notice: "Dastavej was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def dastavej_status_update 
    status = StatusMaster.find(params[:status])
    state_transition = StateTransition.new(from: @dastavej.status.name, item_id: @dastavej.id, item_type: "Dastavej", user_id: current_user.id)
    @dastavej.update(status_id: status.id)
    state_transition.save 
    return head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dastavej
      @dastavej = Dastavej.find_by(uuid: params[:id])
      if @dastavej.blank? 
        @dastavej = Dastavej.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def dastavej_params
      params.require(:dastavej).permit(:client_id, :project_id, :unit_id, :party_name, 
                                       :contact_number, :tower_id, :floor_id, :development_agreement, :ats,
                                       :other_agreement, :corraction_agreement, :hakk_kami, :mortage, :sale_deed, dastavej_pricing_detail_attributes: [:base_price, :additional_amount, :discount_type, :tax_class, :vat_amount, :dastavej_id]  )
    end
end
