require 'rails_helper'

RSpec.describe 'Spree:Products', type: :request do
  describe "ProductAPI" do
    it 'idが1のProductを取得する' do
      product = create(name: "商品名が入ります")
      get "/potepan/products/#{product.id}"

    expect(response.status).to eq(200)
    end
  end
end
