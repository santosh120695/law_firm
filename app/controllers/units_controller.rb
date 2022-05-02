class UnitsController < ApplicationController

    before_action :set_unit, only: [:show]

    def index 
        if params[:clients].present? and params[:projects].present?
            @units  =  Unit.where(tower_id: Tower.where(project_id: Project.find_by(uuid: params[:projects]).id).pluck(:id))
        else 
            @units = []
        end

        respond_to do |format|
            format.html {  }
            format.json { render json: {success: true, data: @units}}
        end

    end


    def new 
        @unit = Unit.new
    end

    def show 
    end

    def create 
        @unit = Unit.new(unit_params)
        if @unit.save 
            redirect_to unit_path(id: @unit.uuid)
        else 
            render :new 
        end
    end

    private 

    def set_unit 
        @unit = Unit.find_by(uuid: params[:id])
    end

    def unit_params 
        params.require(:unit).permit(:name, :rera_carpet_area, :exclusive_area, :open_terrace, :total_area, :undivided_share_of_land, :jantri, :project_id, :tower_id, :floor_id)
    end
end
