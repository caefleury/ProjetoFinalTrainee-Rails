require 'rails_helper'

RSpec.describe "Api::V1::Admins", type: :request do
        describe 'admin login' do
            before do
                create(:admin, email: 'teste@teste', password:'1234567')
            end
            context 'when admin is valid' do
                it 'return http status ok' do
                    get '/api/v1/admins/login', params:{email:'teste@teste', password:'1234567'}
                    expect(response).to have_http_status(:ok)
                end
            end

            context 'when admin has no a valid email' do
                it 'return http status not_found' do
                    get '/api/v1/admins/login', params: {
                        email:'teste@teste.com',
                        password:'123456'
                    }
                    expect(response).to have_http_status(:not_found)
                end
            end
            context 'when admin has not valid password' do
                it 'return http status ok' do
                    get '/api/v1/admins/login', params: {
                        email:'teste@teste',
                        password:'12456'
                    }
                    expect(response).to have_http_status(:unauthorized)
                end
            end
        end
        describe 'admin logout' do
            let(:admin) {create(:admin)}
            before do
                get '/api/v1/admins/login', params: {
                    email:'teste@teste',
                    password: '123456'
                }
            end

            context 'when admin is loged' do
                it 'return http status ok' do
                    get '/api/v1/admins/logout', headers: {
                        'X-Admin-Email':admin.email,
                        'X-Admin-Token':admin.authentication_token
                    }
                    expect(response).to have_http_status(:ok)
                end
            end
        end
    end