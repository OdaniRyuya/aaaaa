require 'rails_helper'

RSpec.describe Potepan::ProductDecorator, type: :model do
  describe "related_products" do
    let(:taxonomy) { create(:taxonomy) }
    let(:taxon1) { create(:taxon, taxonomy:taxonomy) }
    let(:taxon2) { create(:taxon, taxonomy:taxonomy) }
    let(:no_related_product) { create(:product, taxons: [taxon2])}
    let!(:main_product) { create(:product, taxons: [taxon1]) }
    let(:related_products) { main_product.related_products }
    let(:products) { create_list(:product, 4, taxons: [taxon1]) }
    let!(:duplicate_related_product) { create(:product, taxons: [taxon1]) }

    context "related_productsに関連商品が含まれている" do
      it "関連商品が含まれていること" do
        expect(related_products).to eq products
      end
      it "関連してない商品が含まれていないこと" do
        expect(products).not_to include no_related_product.name
      end
      it "メイン商品が含まれていないこと" do
        expect(products).not_to include main_product.name
      end
      it "関連商品が重複していないこと" do
      binding.pry
        expect(related_products).to eq 
      end
    end
  end
end
