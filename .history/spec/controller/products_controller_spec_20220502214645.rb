require 'rails_helper'

RSpec.describe 'Spree::Products', type: :request do
  describe "トップページの表示" do
    before do
      get "/potepan/index"
    end
    it "ステータスコードが成功すること" do
      expect(response).to have_http_status(:success)
    end
    it "トップページの表示に成功すること" do
      expect(response).to have_http_status(200)
    end
  end

  describe "商品詳細ページの表示" do
    before do
    product = create(:product, name: "商品名が入ります")
      get "/potepan/products/#{product.id}"
    end
    it "商品詳細ページの表示に成功すること" do
      expect(response).to have_http_status(200)
    end
  end
end
