class StatusMastersController < ApplicationController
  before_action :set_status_master, only: %i[ show edit update destroy ]

  # GET /status_masters or /status_masters.json
  def index
    @status_masters = StatusMaster.all
  end

  # GET /status_masters/1 or /status_masters/1.json
  def show
  end

  # GET /status_masters/new
  def new
    @status_master = StatusMaster.new
  end

  # GET /status_masters/1/edit
  def edit
  end

  # POST /status_masters or /status_masters.json
  def create
    @status_master = StatusMaster.new(status_master_params)

    respond_to do |format|
      if @status_master.save
        format.html { redirect_to status_master_url(@status_master), notice: "Status master was successfully created." }
        format.json { render :show, status: :created, location: @status_master }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @status_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /status_masters/1 or /status_masters/1.json
  def update
    respond_to do |format|
      if @status_master.update(status_master_params)
        format.html { redirect_to status_master_url(@status_master), notice: "Status master was successfully updated." }
        format.json { render :show, status: :ok, location: @status_master }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @status_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_masters/1 or /status_masters/1.json
  def destroy
    @status_master.destroy

    respond_to do |format|
      format.html { redirect_to status_masters_url, notice: "Status master was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_master
      @status_master = StatusMaster.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def status_master_params
      params.require(:status_master).permit(:name, :color, :active, :uuid)
    end
end
