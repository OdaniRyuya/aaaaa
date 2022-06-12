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

  scenario "The link to '一覧ページに戻る' is correct" do
    expect(page).to have_link '一覧ページへ戻る', href: potepan_category_path(product.taxons.first.id)
  end


end
