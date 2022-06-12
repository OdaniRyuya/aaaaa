require 'rails_helper'

RSpec.describe Potepan::ProductDecorator, type: :model do
  describe "related_products" do
    let(:taxonomy) { create(:taxonomy) }
    let(:taxon1) { create(:taxon, taxonomy: taxonomy) }
    let(:taxon2) { create(:taxon, taxonomy: taxonomy) }
    let(:no_related_product) { create(:product, taxons: [taxon2]) }
    let(:main_product) { create(:product, taxons: [taxon1]) }
    let(:related_products) { main_product.related_products }
    let(:products) { create_list(:product, 4, taxons: [taxon1]) }
    let(:two_taxons_related_product) do
      create(:product, taxons: [taxon1, taxon2])
    end
    let(:duplicate_related_products) do
      Spree::Product.in_taxons(two_taxons_related_product.taxons)
    end

    context "related_productsに関連商品が含まれている" do
      it "関連商品が含まれていて重複していないこと" do
        expect(related_products).to eq products
        expect(related_products.pluck(:id)).to_not eq duplicate_products.pluck(:id)
        binding.pry
      end

      it "関連してない商品が含まれていないこと" do
        expect(related_products).not_to include no_related_product.name
      end

      it "メイン商品が含まれていないこと" do
        expect(related_products).not_to include main_product.name
      end
    end
  end
end
