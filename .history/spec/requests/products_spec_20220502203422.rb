require 'rails_helper'

RSpec.describe 'sample', type: :request do
  describe "Productのリクエストに関して" do
    before(:each) do
      @products = create(:products)
    end
    it '特定のProductを取得する' do

      product = create(title: "title")
      get "/potepan/products/#{product.id}"

      # リクエスト成功を表す200が帰ってきたか確認する
      expect(response.status).to eq(200)

    end
  end
end
