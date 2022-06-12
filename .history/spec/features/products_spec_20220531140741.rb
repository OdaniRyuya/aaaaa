require 'rails_helper'

RSpec.feature "ProductsFeatures", type: :feature do
  let(:taxon) { create(:taxon) }
  let(:product) { create(:product, taxons: [taxon]) }
  let(:image) { create(:image) }
  let(:related_product) { create(:product, taxons: [taxon]) }

  before do
    product.images << image
  end

  describe "タクソノミーに関すること" do
    before { visit potepan_product_path(product.id) }

    scenario "'一覧ページに戻る'のリンクで正しく遷移できること" do
      click_on '一覧ページへ戻る'
      expect(current_path).to eq potepan_category_path(product.taxons.first.id)
    end

    scenario "関連商品のリンクの遷移先が正しいこと" do
      click_on related_product.name
      expect(page).to have_current_path potepan_product_path related_product.id
    end

  end  
end
