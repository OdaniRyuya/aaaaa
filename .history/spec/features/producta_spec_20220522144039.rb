require 'rails_helper'

RSpec.feature "ProductsFeatures", type: :feature do
  let(:taxonomy) { create(:taxonomy, name: "Category") }
  let(:taxon) do
    create(:taxon, name: "Taxon", taxonomy: taxonomy, parent: taxonomy.root)
  end
  let(:product) { create(:product, taxons: [taxon]) }
  describe "タクソノミーに関すること" do
    before before { visit potepan_product_path(product.id) }
  end


end
