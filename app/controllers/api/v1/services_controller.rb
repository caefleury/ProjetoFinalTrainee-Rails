class Api::V1::ServicesController < ApplicationController
    
    acts_as_token_authentication_handler_for Admin, only: [:create, :update, :delete]
  
    def index
      services = Service.all
      render json: services, status: :ok
    end
  
    def show
       service = Service.find(params[:id])
       render json: service, status: :ok
    rescue StandardError => e
      render json: e, status: :not_found
    end
  
    def create
      service = Service.new(services_params)
      service.save!
      render json: service, status: :created
    rescue StandardError => e
      render json: e, status: :bad_request
    end
  
    def update
      service = Service.find(params[:id])
      service.update!(services_params)
      render json: service, status: :ok
    rescue StandardError => e
      render json: e, status: :unprocessable_entity
    end
  
    def delete
      service = Service.find(params[:id])
      service.destroy!
      render json: { message: "Serviço '#{service.name}' deletado com sucesso."}, status: :ok
    rescue StandardError => e
      render json: e, status: :bad_request
    end
  
    private
    def services_params
      params.require(:service).permit(:name, :description)
    end

end
