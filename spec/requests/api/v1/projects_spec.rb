require 'rails_helper'

RSpec.describe "Api::V1::Projects", type: :request do
  describe "/GET #index" do
    it 'return http status OK' do
      get "/api/v1/projects/index"
      expect(response).to have_http_status(:ok)
    end

    it 'returns a JSON' do
      get "/api/v1/projects/index"
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end
  describe "/GET #show" do
    it "if project exist" do
      project = create(:project)
      get "/api/v1/projects/show/#{project.id}"
      expect(response).to have_http_status(:ok)
    end

    it "if project not exist" do
      get "/api/v1/projects/show/35"
      expect(response).to have_http_status(:not_found)
    end
  end
  describe "/GET #create" do
    let(:admin) {create(:admin)}
    let(:projects_params) do 
      {name:'teste', description:'bbbbbbbbb', link:'www.teste.com'}
    end
    context 'params are ok' do
      it 'return http status created' do
        post '/api/v1/projects/create', params: {project: projects_params}, headers: {
          "X-Admin-Email": admin.email,
          "X-Admin-Token": admin.authentication_token
        }
        expect(response).to have_http_status(:created)
      end
    end
    
    context 'bad params' do
      it 'returns http status bad request' do
        projects_params = nil
        post '/api/v1/projects/create', params: {project: projects_params}, headers: {
          "X-Admin-Email": admin.email,
          "X-Admin-Token": admin.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
  describe 'PATCH #update' do
    let(:admin) {create(:admin)}
    let(:project_params) do
      {name:'teste', description:'bbbbbbbbb', link:'www.teste.com'}
    end
      let(:project) {create(:project)}

      context 'params are ok' do
        it 'return http status ok' do
          patch "/api/v1/projects/update/#{project.id}", params:{project:project_params}, headers: {
            "X-Admin-Email": admin.email,
            "X-Admin-Token": admin.authentication_token
          }
          expect(response).to have_http_status(:ok)
        end
      end
      context 'bad params' do
        it 'returns http status bad request' do
          projects_params = nil
          patch "/api/v1/projects/update/54", params:{project:project_params}, headers: {
           "X-Admin-Email": admin.email,
            "X-Admin-Token": admin.authentication_token
          }
          expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
  describe '/DELETE #delete' do
    let(:admin) {create(:admin)}
    let(:project) {create(:project)}
    context 'if project exist' do
      it 'return http status ok' do
        delete "/api/v1/projects/delete/#{project.id}", headers: {
          "X-Admin-Email": admin.email,
          "X-Admin-Token": admin.authentication_token
        }
        expect(response).to  have_http_status(:ok)
      end
    end
    context 'if project not exist' do
      it 'return bad request' do
        delete "/api/v1/projects/delete/999", headers: {
          "X-Admin-Email": admin.email,
          "X-Admin-Token": admin.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
