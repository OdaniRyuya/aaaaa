require 'rails_helper'

RSpec.feature "ProductsFeatures", type: :feature do
  let(:taxonomy) { create(:taxonomy, name: "Category") }
  let(:taxon) do
    create(:taxon, taxonomy: taxonomy, parent: taxonomy.root)
  end
  let(:product) { create(:product, taxons: [taxon]) }
  let(:image) { create(:image) }

  before do
    product.images << image
    visit potepan_product_path(product.id)
  end

  describe "タクソノミーに関すること" do
    scenario "'一覧ページに戻る'のリンクで正しく遷移できること" do
      click_on '一覧ページへ戻る'
      expect(current_path).to eq potepan_category_path(product.taxons.first.id)
    end
  end

  describe "関連商品に関すること" do
      # 同じ商品は表示しない
    expect(page).not_to have_selector ".productCaption h5", text: product.name
    expect(page).not_to have_selector ".productCaption h3", text: product.display_price
    # 関連しない商品は表示しない
    expect(page).not_to have_selector ".productCaption h5", text: other_product.name
    expect(page).not_to have_selector ".productCaption h3", text: other_product.display_price
    # 関連商品が表示される
    related_products.each do |related_product|
      expect(page).to have_selector ".productCaption h5", text: related_product.name
      expect(page).to have_selector ".productCaption h3", text: related_product.display_price
  end
end
