require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:product) { create(:product, taxons: [taxon]) }
  let(:image) { create(:image) }
  let(:taxon) { create(:taxon) }
  let!(:filename) do
    filename = image.attachment_blob.filename
    "#{filename.base}#{filename.extension_with_delimiter}"
  end
  let(:product_lists) { create_list(:product, 5, taxons: [taxon]) }

  before do
    product.images << image
    product_lists.each { |product_list| product_list.images << create(:image) }
  end

  describe "商品詳細ページ" do
    before do
      get potepan_product_path(product.id)
    end

    it "ステータスコードが200か" do
      expect(response).to have_http_status(200)
    end

    it "商品の情報取得ができているか" do
      expect(response.body).to include product.name
      expect(response.body).to include product.display_price.to_s
      expect(response.body).to include product.description
    end

    it "画像が表示されてるか" do
      expect(response.body).to include filename
    end

    it "関連商品を5つ取得しても、商品を4つしか表示しないこと" do
      expect(response.body).to include product_lists.first.name
      expect(response.body).to include product_lists.second.name
      expect(response.body).to include product_lists.third.name
      expect(response.body).to include product_lists.fourth.name
      expect(response.body).not_to include product_lists.fifth.name
      binding.pry
    end
  end
end
