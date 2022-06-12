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
  end

  describe "タクソノミーに関すること" do
    before { visit potepan_product_path(product.id) }

    scenario "'一覧ページに戻る'のリンクで正しく遷移できること" do
      click_on '一覧ページへ戻る'
      expect(current_path).to eq potepan_category_path(product.taxons.first.id)
    end    
  end

  describe "関連商品に関すること" do
    let!(:related_product) { create(:product, taxons: [taxon]) }
    let!(:product_lists) { create_list(:product, 5, taxons: [taxon]) }
    before do
      related_product.images << image
      product_lists.each { |product_list| product_list.images << create(:image) }
    end

    scenario "関連商品を5つ取得してもレスポンスに含まれる商品が4つしかないこと" do
      expect(response.body).to include product_lists.first.name
      expect(response.body).to include product_lists.second.name
      expect(response.body).to include product_lists.third.name
      expect(response.body).to include product_lists.fourth.name
      expect(response.body).not_to include product_lists.fifth.name
    end    
  end

end
