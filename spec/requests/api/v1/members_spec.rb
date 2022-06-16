require 'rails_helper'

RSpec.describe "Api::V1::Members", type: :request do
  describe "/GET #index" do
    it 'return http status OK' do
      get "/api/v1/members/index"
      expect(response).to have_http_status(:ok)
    end

    it 'returns a JSON' do
      get "/api/v1/members/index"
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe "/GET #show" do
    it "if member exist" do
      member = create(:member)
      get "/api/v1/members/show/#{member.id}"
      expect(response).to have_http_status(:ok)
    end

    it "if member not exist" do
      get "/api/v1/members/show/35"
      expect(response).to have_http_status(:not_found)
    end
  end
  describe "/GET #create" do
    let(:admin) {create(:admin)}
    let(:role) {create(:role)}
    let(:members_params) do 
      {name:'teste', role_id:role.id}
    end
    context 'params are ok' do
      it 'return http status created' do
        post '/api/v1/members/create', params: {member: members_params}, headers: {
          "X-Admin-Email": admin.email,
          "X-Admin-Token": admin.authentication_token
        }
        expect(response).to have_http_status(:created)
      end
    end
    
    context 'bad params' do
      it 'returns http status bad request' do
        members_params = nil
        post '/api/v1/members/create', params: {contact: members_params}, headers: {
          "X-Admin-Email": admin.email,
          "X-Admin-Token": admin.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
  describe 'PATCH #update' do
    let(:admin) {create(:admin)}
    let(:role) {create(:role)}
    let(:member_params) do
      {name:'teste', role_id: role.id}
    end
      let(:member) {create(:member)}

      context 'params are ok' do
        it 'return http status ok' do
          patch "/api/v1/members/update/#{member.id}", params:{member:member_params}, headers: {
            "X-Admin-Email": admin.email,
            "X-Admin-Token": admin.authentication_token
          }
          expect(response).to have_http_status(:ok)
        end
      end
      context 'bad params' do
        it 'returns http status bad request' do
          members_params = nil
          patch "/api/v1/members/update/54", params:{member:member_params}, headers: {
           "X-Admin-Email": admin.email,
            "X-Admin-Token": admin.authentication_token
          }
          expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
  describe '/DELETE #delete' do
    let(:admin) {create(:admin)}
    let(:member) {create(:member)}
    context 'if member exist' do
      it 'return http status ok' do
        delete "/api/v1/members/delete/#{member.id}", headers: {
          "X-Admin-Email": admin.email,
          "X-Admin-Token": admin.authentication_token
        }
        expect(response).to  have_http_status(:ok)
      end
    end
    context 'if member not exist' do
      it 'return bad request' do
        delete "/api/v1/members/delete/999", headers: {
          "X-Admin-Email": admin.email,
          "X-Admin-Token": admin.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end


   