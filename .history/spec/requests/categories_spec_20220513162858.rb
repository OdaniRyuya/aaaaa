require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  let(:product) { create(:product, taxons: [taxon]) }
  let(:image) { create(:image) }
  let(:taxon) { create(:taxon) }
  let!(:filename) do
    filename = image.attachment_blob.filename
    "#{filename.base}#{filename.extension_with_delimiter}"
  end

  before do
    product.images << image
  end

  describe "カテゴリーページ" do
    before do
      get potepan_product_path(product.id)
    end

    it "ステータスコードが200か" do
      expect(response).to have_http_status(200)
    end
  end
end
