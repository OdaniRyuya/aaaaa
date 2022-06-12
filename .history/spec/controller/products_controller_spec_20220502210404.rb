require 'rails_helper'

RSpec.describe 'Spree::Products', type: :request do
  describe "トップページの表示" do
    before do
      get "/potepan/index"
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
