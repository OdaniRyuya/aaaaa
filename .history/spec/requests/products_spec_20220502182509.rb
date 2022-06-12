require 'rails_helper'

RSpec.describe '商品詳細ページ' do
  it 'idが1のProductを取得する' do
    get "/potepan/products/#{product.id}"
    product = create(:product, name: "")

    expect(response.status).to eq(200)
  end
end
