require 'rails_helper'

RSpec.feature "CategoriesFeatures", type: :feature do
  let(:taxonomy) { create(:taxonomy, name: "Category") }
  let(:taxon) { create(:taxon, parent: taxonomy.root) }
  let!(:cap) { create(:taxon, name: "cap", taxonomy: taxonomy, parent: taxonomy.root) }
  let(:shirts) { create(:taxon, name: "shirts", taxonomy: taxonomy, parent: taxon) }
  let(:product) do
    create(:product, name: "Shirt", price: "19.99", taxons: [shirts])
  end
  let(:image) { create(:image) }
  let!(:filename) do
    filename = image.attachment_blob.filename
    "#{filename.base}#{filename.extension_with_delimiter}"
  end

  before do
    product.images << image
  end

  describe "タクソノミーに関すること" do
    before { visit potepan_category_path(taxonomy.root.id) }

    scenario "カテゴリーページの表示が正しいこと" do
      expect(page).to have_title "#{taxonomy.root.name} - BIGBAG Store"
      expect(page).to have_selector ".page-title h2", text: "Category"
      expect(page).to have_selector ".breadcrumb", text: "Category"
      expect(page).to have_selector ".panel-body", text: shirts.name
      expect(page).to have_selector ".panel-body", text: cap.name
      expect(page).to have_selector ".productCaption h5", text: product.name
      expect(page).to have_selector ".productCaption h3", text: product.display_price
    end
  end

  describe "capカテゴリに関すること"
    before { visit potepan_category_path(cap.id) }

    scenario "capページの表示が正しいこと" do
    expect(page).to have_title "#{cap.name} - "

    end
end
