require 'rails_helper'

RSpec.describe 'sample', type: :request do
  describe "Productのリクエストに関して" do
    before(:each) do
      @products = create(:products)
    end
    it '商品詳細画面の表示に成功すること' do
      get "/potepan/products/#{@product.id}"
      
      # リクエスト成功を表す200が帰ってきたか確認する
      expect(response.status).to eq(200)

    end
  end
end
