class TitlesController < ApplicationController
  before_action :set_title, only: %i[ update destroy ]
  before_action :set_title_uuid, only: %i[ show edit  status_update]
  skip_before_action :verify_authenticity_token, only: [:status_update]

  # GET /titles or /titles.json
  def index
    @titles = Title.all
  end

  # GET /titles/1 or /titles/1.json
  def show
  end

  # GET /titles/new
  def new
    @title = Title.new
    @title.build_pricing_detail
  end

  # GET /titles/1/edit
  def edit
  end

  # POST /titles or /titles.json
  def create
    @title = Title.new(title_params)

    respond_to do |format|
      if @title.save
        format.html { redirect_to title_url(id: @title.uuid), notice: "Title was successfully created." }
        format.json { render :show, status: :created, location: @title }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @title.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /titles/1 or /titles/1.json
  def update
    respond_to do |format|
      if @title.update!(title_params)
        format.html { redirect_to title_url(@title), notice: "Title was successfully updated." }
        format.json { render :show, status: :ok, location: @title }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /titles/1 or /titles/1.json
  def destroy
    @title.destroy

    respond_to do |format|
      format.html { redirect_to titles_url, notice: "Title was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def status_update 
    status  = StatusMaster.find(params[:status])
    state_transition = StateTransition.new(from: @title.status.name, item_id: @title.id, item_type: "Title", user_id: current_user.id)
    @title.update!(status_id: status.id)
    state_transition.to =  @title.status.name 
    state_transition.save!
    return head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_title
      @title = Title.find_by(id: params[:id])
    end
    def set_title_uuid
      @title = Title.find_by(uuid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def title_params
      params.require(:title).permit(:client_id, :block_no, :pincode, :village, :taluka, :description, pricing_detail_attributes: [:base_price, :additional_amount, :discount_type, :tax_class, :vat_amount, :title_id])
    end
end
