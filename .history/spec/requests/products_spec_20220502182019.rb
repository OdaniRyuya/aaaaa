require 'rails_helper'

RSpec.describe '商品詳細ページ' do
  it '特定のProductを取得' do
    get "/potepan/products/#{product.id}"


    expect(response.status).to eq(200)
  end
end
