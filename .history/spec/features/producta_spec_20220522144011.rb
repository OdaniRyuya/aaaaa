require 'rails_helper'

RSpec.feature "ProductsFeatures", type: :feature do

  describe "タクソノミーに関すること" do
    before before { visit potepan_product_path(product.id) }
  end


end
