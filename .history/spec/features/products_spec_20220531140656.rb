require 'rails_helper'

RSpec.feature "Potepan::ProductsShows", type: :feature do
  feature "商品の詳細ページを見ることができる" do
    given!(:taxon) { create(:taxon) }
    given!(:product) { create(:product, taxons: [taxon]) }
    given!(:related_product) { create(:product, taxons: [taxon]) }
    given!(:not_related_product) { create(:product) }
    background do
      visit potepan_product_path product.id
    end

    scenario "詳細ページにアクセス時、商品名や価格などの情報が表示される" do
      product_options = product.option_types
      max_stock = product.total_on_hand
      expect(page).to have_title "#{product.name} - BIGBAG Store"
      expect(page).to have_content product.name
      expect(page).to have_content product.display_price
      expect(page).to have_content product.description
      product_options.each do |product_option|
        product_option.option_values.each do |option_value|
          expect(page).to have_content option_value.presentation
        end
      end
      expect(page).to have_content max_stock
    end

    scenario "一覧ページへ戻るをクリック時、カテゴリ商品一覧ページへ移動する" do
      product.master.images.create!(attachment: create(:image).attachment)
      related_product.master.images.create!(attachment: create(:image).attachment)
      click_on "一覧ページへ戻る"
      expect(page).to have_current_path potepan_category_path product.taxons.first.id
    end

    scenario "カートを入れるをクリック時、買い物カゴページへ移動する" do
      within "#add_to_cart" do
        click_on "カートへ入れる"
      end
      expect(page).to have_current_path potepan_cart_page_path
    end

    scenario "関連商品の商品名と価格が表示されている" do
      within "#related_products" do
        expect(page).to have_content related_product.name
        expect(page).to have_content related_product.display_price
      end
      expect(page).not_to have_content not_related_product.name
    end

    scenario "関連商品をクリック時、商品詳細ページへ移動する" do
      click_on related_product.name
      expect(page).to have_current_path potepan_product_path related_product.id
    end
  end
end
