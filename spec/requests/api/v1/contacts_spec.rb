require 'rails_helper'

RSpec.describe "Api::V1::Contacts", type: :request do
  describe "/GET #create" do
    let(:admin) {create(:admin)}
    let(:contact_params) do
      {name:'teste', email:'teste@teste', telephone:'99999999', description:"aaaaaa", budget:'9999', date:"Sun, 01 Jan 2012 00:00:00 +0300"}
    end
    context 'params are ok' do
      it 'return http status created' do
        post '/api/v1/contacts/create', params: {contact: contact_params}, headers: {
          "X-Admin-Email": admin.email,
          "X-Admin-Token": admin.authentication_token
        }
        expect(response).to have_http_status(:created)
      end
    end
    
    context 'bad params' do
      it 'returns http status bad request' do
        contact_params = nil
        post '/api/v1/contacts/create', params: {contact: contact_params}, headers: {
          "X-Admin-Email": admin.email,
          "X-Admin-Token": admin.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end