require 'rails_helper'

RSpec.describe '商品詳細ページ' do
  it 'リクエストが成功しているか' do
    get "/potepan/products/#{product.id}"
    
    expect(response.status).to eq(200)
  end
end
