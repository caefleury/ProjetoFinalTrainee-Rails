class Api::V1::ContactsController < ApplicationController
    
    acts_as_token_authentication_handler_for Admin
    
    def create
        contact = Contact.new(contacts_params)
        contact.save!
        render json: contact, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    private
    def contacts_params
        params.require(:contact).permit(:name, :email, :telephone, :description, :budget, :date)
    end
end
