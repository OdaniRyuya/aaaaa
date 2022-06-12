require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:product) { create(:product, taxons: [taxon]) }
  let(:image) { create(:image) }
  let(:taxon) { create(:taxon) }
  let!(:filename) do
    filename = image.attachment_blob.filename
    "#{filename.base}#{filename.extension_with_delimiter}"
  end


  before do
    product.images << image
    products.each { |product| product.images << create(:image) }
  end

  describe "商品詳細ページ" do
    before do
      get potepan_product_path(product.id)
    end

    it "ステータスコードが200のこと" do
      expect(response).to have_http_status(200)
    end

    it "商品の情報取得ができていること" do
      expect(response.body).to include product.name
      expect(response.body).to include product.display_price.to_s
      expect(response.body).to include product.description
    end

    it "画像が表示されてること" do
      expect(response.body).to include filename
    end

    it "関連商品の情報取得ができていること" do
      products.first(4).each do |product|
        expect(response.body).to include product.name
        expect(response.body).to include product.display_price.to_s
      end
    end
  end
end
