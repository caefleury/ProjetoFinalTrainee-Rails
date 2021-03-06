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
        render json: { message: "Projeto '#{project.name}' deletado com sucesso."}, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def add_photo
        project = Project.find(params[:id])
        if project.photo.attached?
            project.photo.purge
        end
        params[:photo].each do |photo|
            project.photo.attach(photo)
        end
        render json: project
    end

    def removeMemberFromProject
        project_member = ProjectMember.find_by!(member_id: params[:member_id], project_id: params[:project_id])
        project_member.destroy!
        head(:ok)
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def addMemberFromProject
        project_member = ProjectMember.new(member_id: params[:member_id], project_id: params[:project_id], project_role_id: params[:project_role_id])
        project_member.save!
        render json: project_member, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    private
    def projects_params
        params.require(:project).permit(:name, :link, :description, :photo_url)
    end
end
