# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LineLoginApis', type: :request do
  describe 'GET /login' do
    it 'redirects to the LINE authorization URL' do
      get line_login_api_login_path # 適切なパスを指定するダ
      expect(response).to redirect_to(/access.line.me/)
      expect(session[:state]).to be_present
    end
  end
end
