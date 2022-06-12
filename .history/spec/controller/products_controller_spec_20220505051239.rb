require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:product) { create(:product) }


#  describe "トップページ" do
#    before do
#      get potepan_path
#    end
#
#    it "200レスポンスが返ってきているか" do
#      expect(response).to have_http_status(200)
#    end
#  end
#
  describe "商品詳細ページ" do
    before do
      get potepan_product_path(product.id)
    end
#
#    it "200レスポンスが返ってきているか" do
#      expect(response).to have_http_status(200)
#    end
#
#    it "商品の情報取得ができているか" do
#      expect(response.body).to include product.name
#      expect(response.body).to include product.price.to_s
#      expect(response.body).to include product.description
#    end
#
    it "画像が表示されてるか" do
    binding.pry
      product.images.each do |image|
        expect(response.body).to include image.attachment.to_s
      end
    end
  end
end
