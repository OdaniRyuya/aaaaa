require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  let(:product) { create(:product, taxons: [taxon]) }
  let(:image) { create(:image) }
  let(:taxonomy) { create(:taxonomy) }
  let(:taxon) { create(:taxon, parent_id: taxonomy.root.id) }
  let!(:filename) do
    filename = image.attachment_blob.filename
    "#{filename.base}#{filename.extension_with_delimiter}"
  end

  before do
    product.images << image
  end

  describe "カテゴリーページ" do
    before do
      get potepan_category_path(taxon.id)
    end

    it "taxonのカテゴリ名が取得できているか" do
      expect(response.body).to include taxon.name
    end

    it "taxonomyのカテゴリ名が取得できているか" do
      expect(response.body).to include taxonomy.name
    end

    it "ステータスコードが200か" do
      expect(response).to have_http_status(200)
    end

    it "商品の情報取得ができているか" do
      expect(response.body).to include product.name
      expect(response.body).to include product.display_price.to_s
    end

        it "画像が表示されてるか" do
      expect(response.body).to include filename
    end
  end
end
