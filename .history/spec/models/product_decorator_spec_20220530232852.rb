require 'rails_helper'

RSpec.describe Potepan::ProductDecorator, type: :model do
  describe "related_products" do
    let(:taxonomy) { create(:taxonomy) }
    let(:taxon1) { create(:taxon, taxonomy:taxonomy) }
    let(:taxon2) { create(:taxon, taxonomy:taxonomy) }
    let(:taxon3) { create(:taxon, taxonomy:taxonomy) }
    let(:no_related_product) { create(:product, taxons: []) }
    let!(:main_product) { create(:product, taxons: [taxon1]) }
    let(:related_products) { main_product.related_products }
    let(:products) { create_list(:product, 4, taxons: [taxon1]) }

    context "related_products配列に関連商品が含まれている" do
      it "関連商品が含まれていること" do
      binding.pry
        expect(products).to eq related_products
      end
      it "関連してない商品が含まれていないこと" do
      binding.pry
        expect(products).not_to match no_related_product
      end
      it "メイン商品が含まれていないこと" do
        expect(related_products).not_to match main_product
      end
      it "関連商品が重複していないこと" do
        expect(related_products == related_products.distinct).to be true
      end
    end
  end
end
