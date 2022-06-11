class Api::V1::MembersController < ApplicationController
  
  acts_as_token_authentication_handler_for Admin, only: [:create, :update, :delete]
  
  def index
    members = Member.all
    render json: members, status: :ok
  end

  def show
     member = Member.find(params[:id])
     render json: member, status: :ok
  rescue StandardError => e
    render json: e, status: :not_found
  end

  def create
    member = Member.new(members_params)
    member.save!
    render json: member, status: :created
  rescue StandardError => e
    render json: e, status: :bad_request
  end

  def update
    member = Member.find(params[:id])
    member.update!(members_params)
    render json: member, status: :ok
  rescue StandardError => e
    render json: e, status: :unprocessable_entity
  end

  def delete
    member = Member.find(params[:id])
    member.destroy!
    render json: { message: "Membro #{member.name} deletado com sucesso"}, status: :ok
  rescue StandardError => e
    render json: e, status: :bad_request
  end

  private
  def members_params
    params.require(:member).permit(:name, :role_id)
  end
end