require 'rails_helper'

RSpec.describe 'Products' do
  it '商品詳細ページの表示' do
    expect(responce).to have_http_status(200)
  end
end
