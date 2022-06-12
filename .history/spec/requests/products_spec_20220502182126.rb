require 'rails_helper'

RSpec.describe '商品詳細ページ' do
  it '特定のProductを取得する' do
    get "/potepan/products/#{product.id}"
    product = create(:p)


    expect(response.status).to eq(200)
  end
end
