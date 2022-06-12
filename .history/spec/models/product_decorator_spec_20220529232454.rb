require 'rails_helper'

RSpec.describe Potepan::ProductDecorator, type: :model do
  describe "related_products" do
  let(:related_product_count) { 4 }
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
    it "related_product1があること" do
      expect(related_products).to include related_product1
    end

    it "related_product1があること" do
      expect(related_products).to include related_product2
    end

    it "related_product1があること" do
      expect(related_products).to include related_product3
    end

    it "related_product1があること" do
      expect(related_products).to include related_product4
    end

    it "have not the no_related_product" do
      expect(related_products).not_to match no_related_product
    end

    it "have not the main_product" do
      expect(related_products).not_to match main_product
    end
  end

    it "have no same product" do
    expect(related_products == related_products.distinct).to be true
    end
  end
end
