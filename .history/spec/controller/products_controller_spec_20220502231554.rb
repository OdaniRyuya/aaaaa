require 'rails_helper'

RSpec.describe 'Products', type: :request do
  
  let!(:product) { create(:product)}
  let!(:image) { create(:image)}
  
  describe "トップページ" do
    before do
      get "/potepan/index"
    end
    it "正常なレスポンスか" do
      expect(response).to have_http_status(:success)
    end
    it "200レスポンスが返ってきているか" do
      expect(response).to have_http_status(200)
    end
  end

  describe "商品詳細ページ" do

    before do
      get "/potepan/products/#{product.id}"
    end

    it "正常なレスポンスか" do
      expect(response).to have_http_status(:success)
    end

    it "200レスポンスが返ってきているか" do
      expect(response).to have_http_status(200)
    end

    it "商品の情報取得ができているか" do
      expect(response.body).to include product.name
      expect(response.body).to include product.price.to_s
      expect(response.body).to include product.description
    end

  end
end
