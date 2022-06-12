require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe "ProductAPI" do
    it '特定のProductを取得する' do
      product = create(:products, title: "title")
      get "/potepan/products/#{product.id}"
      expect(response.status).to eq(200)
    end
  end
end
