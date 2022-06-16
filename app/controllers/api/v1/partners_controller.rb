class Api::V1::PartnersController < ApplicationController
    
    acts_as_token_authentication_handler_for Admin, only: [:create, :update, :delete]
  
    def index
        partners = Partner.all
        render json: partners, status: :ok
    end

    def show
        partner = Partner.find(params[:id])
        render json: partner, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def create
        partner = Partner.new(partners_params)
        partner.save!
        render json: partner, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def update
        partner = Partner.find(params[:id])
        partner.update!(partners_params)
        render json: partner, status: :ok
    rescue StandardError => e
        render json: e, status: :unprocessable_entity
    end

    def delete
        partner = Partner.find(params[:id])
        partner.destroy!
        render json: { message: "Parceiro '#{partner.name}' deletado com sucesso."}, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    private
    def partners_params
        params.require(:partner).permit(:name, :link, :photo_url)
    end
end
