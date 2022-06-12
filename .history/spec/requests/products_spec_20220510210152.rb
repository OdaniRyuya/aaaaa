require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:product) { create(:product) }
  let(:image) { create(:image) }
  let!(:filename) do
    filename = image.attachment_blob.filename
    "#{filename.base}#{filename.extension_with_delimiter}"
  end

  before do
    product.images << image
        # 画像URL取得が上手くいかない問題への対応
    # https://mng-camp.potepan.com/curriculums/document-for-final-task-2#notes-of-image-test
    ActiveStorage::Current.host = request.base_url
  end

  before do
    ...

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
  end
end
