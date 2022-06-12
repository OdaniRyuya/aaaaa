require 'rails_helper'

RSpec.feature "ProductsFeatures", type: :feature do
  
  let(:product) { create(:product, taxons: [taxon]) }
  describe "タクソノミーに関すること" do
    before before { visit potepan_product_path(product.id) }
  end


end
