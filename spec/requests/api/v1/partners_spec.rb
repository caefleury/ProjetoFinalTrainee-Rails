require 'rails_helper'

RSpec.describe "Api::V1::Partners", type: :request do
  describe "/GET #index" do
    it 'return http status OK' do
      get "/api/v1/partners/index"
      expect(response).to have_http_status(:ok)
    end

    it 'returns a JSON' do
      get "/api/v1/partners/index"
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end
  describe "/GET #show" do
    it "if partner exist" do
      partner = create(:partner)
      get "/api/v1/partners/show/#{partner.id}"
      expect(response).to have_http_status(:ok)
    end

    it "if partner not exist" do
      get "/api/v1/partners/show/35"
      expect(response).to have_http_status(:not_found)
    end
  end
  describe "/GET #create" do
    let(:admin) {create(:admin)}
    let(:partners_params) do 
      {name:'teste', link:'www.teste.com'}
    end
    context 'params are ok' do
      it 'return http status created' do
        post '/api/v1/partners/create', params: {partner: partners_params}, headers: {
          "X-Admin-Email": admin.email,
          "X-Admin-Token": admin.authentication_token
        }
        expect(response).to have_http_status(:created)
      end
    end
    
    context 'bad params' do
      it 'returns http status bad request' do
        partners_params = nil
        post '/api/v1/partners/create', params: {partner: partners_params}, headers: {
          "X-Admin-Email": admin.email,
          "X-Admin-Token": admin.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
  describe 'PATCH #update' do
    let(:admin) {create(:admin)}
    let(:partner_params) do
      {name:'teste', link: "www.teste"}
    end
      let(:partner) {create(:partner)}

      context 'params are ok' do
        it 'return http status ok' do
          patch "/api/v1/partners/update/#{partner.id}", params:{partner:partner_params}, headers: {
            "X-Admin-Email": admin.email,
            "X-Admin-Token": admin.authentication_token
          }
          expect(response).to have_http_status(:ok)
        end
      end
      context 'bad params' do
        it 'returns http status bad request' do
          partners_params = nil
          patch "/api/v1/partners/update/54", params:{partner:partner_params}, headers: {
           "X-Admin-Email": admin.email,
            "X-Admin-Token": admin.authentication_token
          }
          expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
  describe '/DELETE #delete' do
    let(:admin) {create(:admin)}
    let(:partner) {create(:partner)}
    context 'if partner exist' do
      it 'return http status ok' do
        delete "/api/v1/partners/delete/#{partner.id}", headers: {
          "X-Admin-Email": admin.email,
          "X-Admin-Token": admin.authentication_token
        }
        expect(response).to  have_http_status(:ok)
      end
    end
    context 'if partner not exist' do
      it 'return bad request' do
        delete "/api/v1/partners/delete/999", headers: {
          "X-Admin-Email": admin.email,
          "X-Admin-Token": admin.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
