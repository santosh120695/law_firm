class StageMastersController < ApplicationController
  before_action :set_stage_master, only: %i[ show edit update destroy ]

  # GET /stage_masters or /stage_masters.json
  def index
    @stage_masters = StageMaster.all
  end

  # GET /stage_masters/1 or /stage_masters/1.json
  def show
  end

  # GET /stage_masters/new
  def new
    @stage_master = StageMaster.new
  end

  # GET /stage_masters/1/edit
  def edit
  end

  # POST /stage_masters or /stage_masters.json
  def create
    @stage_master = StageMaster.new(stage_master_params)

    respond_to do |format|
      if @stage_master.save
        format.html { redirect_to stage_master_url(@stage_master), notice: "Stage master was successfully created." }
        format.json { render :show, status: :created, location: @stage_master }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stage_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stage_masters/1 or /stage_masters/1.json
  def update
    respond_to do |format|
      if @stage_master.update(stage_master_params)
        format.html { redirect_to stage_master_url(@stage_master), notice: "Stage master was successfully updated." }
        format.json { render :show, status: :ok, location: @stage_master }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stage_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stage_masters/1 or /stage_masters/1.json
  def destroy
    @stage_master.destroy

    respond_to do |format|
      format.html { redirect_to stage_masters_url, notice: "Stage master was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stage_master
      @stage_master = StageMaster.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stage_master_params
      params.require(:stage_master).permit(:name)
    end
end
