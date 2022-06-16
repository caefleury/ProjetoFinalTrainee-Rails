require 'rails_helper'

RSpec.describe "Api::V1::Services", type: :request do
  describe "/GET #index" do
    it 'return http status OK' do
      get "/api/v1/services/index"
      expect(response).to have_http_status(:ok)
    end

    it 'returns a JSON' do
      get "/api/v1/services/index"
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end
  
  describe "/GET #show" do
    it "if service exist" do
      service = create(:service)
      get "/api/v1/services/show/#{service.id}"
      expect(response).to have_http_status(:ok)
    end

    it "if service not exist" do
      get "/api/v1/services/show/35"
      expect(response).to have_http_status(:not_found)
    end
  end
  describe "/POST #create" do
    let(:admin) {create(:admin)}
    let(:services_params) do 
      {name:'teste', description:'aaaaaaa'}
    end
    context 'params are ok' do
      it 'return http status created' do
        post '/api/v1/services/create', params: {service: services_params}, headers: {
          "X-Admin-Email": admin.email,
          "X-Admin-Token": admin.authentication_token
        }
        expect(response).to have_http_status(:created)
      end
    end
    
    context 'bad params' do
      it 'returns http status bad request' do
        services_params = nil
        post '/api/v1/services/create', params: {service: services_params}, headers: {
          "X-Admin-Email": admin.email,
          "X-Admin-Token": admin.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
  describe 'PATCH #update' do
    let(:admin) {create(:admin)}
    let(:service_params) do
      {name:'teste', description:'bbbbbbbbb'}
    end
      let(:service) {create(:service)}

      context 'params are ok' do
        it 'return http status ok' do
          patch "/api/v1/services/update/#{service.id}", params:{service:service_params}, headers: {
            "X-Admin-Email": admin.email,
            "X-Admin-Token": admin.authentication_token
          }
          expect(response).to have_http_status(:ok)
        end
      end
      context 'bad params' do
        it 'returns http status bad request' do
          services_params = nil
          patch "/api/v1/services/update/54", params:{service:service_params}, headers: {
           "X-Admin-Email": admin.email,
            "X-Admin-Token": admin.authentication_token
          }
          expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
  describe '/DELETE #delete' do
    let(:admin) {create(:admin)}
    let(:service) {create(:service)}
    context 'if service exist' do
      it 'return http status ok' do
        delete "/api/v1/services/delete/#{service.id}", headers: {
          "X-Admin-Email": admin.email,
          "X-Admin-Token": admin.authentication_token
        }
        expect(response).to  have_http_status(:ok)
      end
    end
    context 'if service not exist' do
      it 'return bad request' do
        delete "/api/v1/services/delete/999", headers: {
          "X-Admin-Email": admin.email,
          "X-Admin-Token": admin.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
