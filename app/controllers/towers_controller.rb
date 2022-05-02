class TowersController < ApplicationController

    before_action :set_tower_by_uuid, only: [:show]
    before_action :set_tower, only: [:update, :destroy]

    def index 
        if params[:clients].present? and params[:projects].present?
            @towers = Tower.where(project_id: Project.find_by(uuid: params[:projects]).id)
        else 
            @towers = []
        end
    end

    def new 
        @tower = Tower.new(project_id: Project.find_by(uuid: params[:project_id]).id)
    end

    def show 
    end
    
    def create 
        @tower = Tower.new(tower_params)
        if @tower.save 
            redirect_to towers_path(clients: @tower.project.client.id, projects: @tower.project.uuid)
        else 
            render :new
        end
    end

    def update 
    end

    def destroy 
    end

    private

    def set_tower
        @tower = Tower.find(params[:id])
    end

    def set_tower_by_uuid 
        @tower  = Tower.find_by(uuid: params[:id])
    end
    
    def tower_params 
        params.require(:tower).permit(:name, :total_floor, :project_id)
    end
end
