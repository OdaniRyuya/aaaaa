require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:product) { create(:product) }
  let(:image) { create(:image) }
  let(:taxon) { create(:taxon) }

  before do
    product.images << image
  end

  describe "カテゴリーページ" do
      it "商品の情報取得ができているか" do
      expect(response.body).to include taxon.name
      expect(response.body).to include taxon.display_price.to_s
      expect(response.body).to include taxon.description
    end
  end

end
