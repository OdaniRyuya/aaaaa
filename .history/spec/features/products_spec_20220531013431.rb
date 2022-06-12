require 'rails_helper'

RSpec.feature "ProductsFeatures", type: :feature do
  let(:taxonomy) { create(:taxonomy, name: "Category") }
  let(:taxon) do
    create(:taxon, taxonomy: taxonomy, parent: taxonomy.root)
  end
  let(:product) { create(:product, taxons: [taxon]) }
  let(:image) { create(:image) }
  let(:related_product) { create(:product, name: 'related_product', taxons: [taxon]) }

  before do
    product.images << image
  end

  describe "タクソノミーに関すること" do
    before { visit potepan_product_path(product.id) }

    scenario "'一覧ページに戻る'のリンクで正しく遷移できること" do
      click_on '一覧ページへ戻る'
      expect(current_path).to eq potepan_category_path(product.taxons.first.id)
    end

    scenario "関連商品のリンクが正しく遷移できること" do
    binding.pry
      click_link related_product.name
      visit potepan_product_path(related_product.id)
      expect(page).to have_content related_product.name
    end
  end
end