require 'rails_helper'

RSpec.describe 'Spree:Products', type: :request do
  describe "ProductAPI" do
    it '特定のProductを取得する' do
      product = create(:product, name: "商品名が入ります")
      get "/potepan/products/#{product.id}"

    expect(response.status).to eq(200)
    end
  end
end
