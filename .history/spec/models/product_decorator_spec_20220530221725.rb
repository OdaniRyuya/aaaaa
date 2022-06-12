require 'rails_helper'

RSpec.describe Potepan::ProductDecorator, type: :model do
  describe "related_products" do
    let(:taxonomy) { create(:taxonomy) }
    let(:taxon1) { create(:taxon, taxonomy:taxonomy) }
    let(:taxon2) { create(:taxon, taxonomy:taxonomy) }
    let(:taxon3) { create(:taxon, taxonomy:taxonomy) }
    let(:taxon4) { create(:taxon, taxonomy:taxonomy) }
    let(:taxon5) { create(:taxon, taxonomy:taxonomy) }
    let!(:related_product1) { create(:product, taxons: [taxon1, taxon2]) }
    let!(:related_product2) { create(:product, taxons: [taxon2, taxon3]) }
    let!(:related_product3) { create(:product, taxons: [taxon3, taxon4]) }
    let!(:related_product4) { create(:product, taxons: [taxon4, taxon5]) }
    let(:no_related_product) { create(:product) }
    let!(:main_product) { create(:product, taxons: [taxon1, taxon2, taxon3, taxon4, taxon5]) }
    let(:related_products) { main_product.related_products }

    context "related_products配列に関連商品が含まれている" do
      it "商品1が含まれていること" do
        expect(related_products).to include related_product1
      end
      it "商品2が含まれていること" do
        expect(related_products).to include related_product2
      end
      it "商品3が含まれていること" do
        expect(related_products).to include related_product3
      end
      it "商品4が含まれていること" do
        expect(related_products).to include related_product4
      end
      it "関連してない商品が含まれていないこと" do
        expect(related_products).not_to match no_related_product
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
