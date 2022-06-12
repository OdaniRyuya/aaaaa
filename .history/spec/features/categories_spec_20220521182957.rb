require 'rails_helper'

RSpec.feature "CategoriesFeatures", type: :feature do
  let(:taxonomy) { create(:taxonomy, name: "Category") }
  let(:taxon) { create(:taxon, parent: taxonomy.root) }
  let!(:shirts) { create(:taxon, name: "shirts", taxonomy: taxonomy, parent: taxon) }
  let(:product) { create(:product, name: "SOLIDUS T-SHIRT", price: "19.99")}

  describe "タクソノミーに関して" do
    before { visit potepan_category_path(taxonomy.root.id) }

    scenario "カテゴリーページが表示が正しいか" do
      expect(page).to have_title "#{taxonomy.root.name} - BIGBAG Store"
      expect(page).to have_selector ".page-title h2", text: "Category"
      expect(page).to have_selector ".breadcrumb", text: "Category"
      expect(page).to have_selector ".panel-body", text: shirts.name
      expect(page).to have_selector ".panel-body", text: test_taxonomy.name

    end
  end
end
