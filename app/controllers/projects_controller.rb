class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :add_towers, :get_towers]

    def index 
        respond_to do |format|
            format.html { 
                @client = Client.find_by(uuid: params[:client_id])
                if @client.present? 
                    @projects = @client.projects 
                else 
                    @projects = Project.all
                end
             }
             format.json {
                 @client = Client.find(params[:id])
                 render json: {success: true, data: @client.projects}
             }
        end
    end

    def create 
        @project = Project.new(project_params)

        if @project.save 
            redirect_to @project
        else 
            redirect_to projects_path(client_id: @project.client.uuid)
        end
    end

    def show 
    end

    def add_towers 
        tower = Tower.new(tower_params)
        tower.project_id = @project.id
        if tower.save! 
            redirect_to @project
        else 
            redirect_to @project
        end 

    end

    def get_towers 
        render json: {success: true, data: @project.towers.pluck(:name, :id)}
    end
    
    def get_floors
        tower = Tower.find(params[:tower_id])
        render json: {success: true, data: tower.floors.pluck(:name, :id)}
    end

    private 

    def set_project 
        @project = Project.find(params[:id])
    end

    def project_params
        params.require(:project).permit(:name, :client_id)
    end

    def tower_params 
        params.require(:tower).permit(:name, :total_floor)
    end
end
