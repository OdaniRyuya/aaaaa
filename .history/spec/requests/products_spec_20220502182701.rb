require 'rails_helper'

RSpec.describe '商品詳細ページ' do
  it 'idが1のProductを取得する' do
    product = create(name: "商品名が入ります")
    get "/potepan/products/#{product.id}"

    expect(response.status).to eq(200)
  end
end
