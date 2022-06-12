class Api::V1::ProjectsController < ApplicationController
    
    acts_as_token_authentication_handler_for Admin, only: [:create, :update, :delete]
  
    def index
        projects = Project.all
        render json: projects, status: :ok
    end

    def show
        project = Project.find(params[:id])
        render json: project, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def create
        project = Project.new(projects_params)
        project.save!
        render json: project, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def update
        project = Project.find(params[:id])
        project.update!(projects_params)
        render json: project, status: :ok
    rescue StandardError => e
        render json: e, status: :unprocessable_entity
    end

    def delete
        project = Project.find(params[:id])
        project.destroy!
        render json: { message: "Projeto '#{project.name}' deletado com sucesso"}, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    private
    def projects_params
        params.require(:project).permit(:name, :link, :description)
    end
end
