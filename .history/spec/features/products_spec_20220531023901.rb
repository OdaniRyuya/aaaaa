require 'rails_helper'

RSpec.feature "ProductsFeatures", type: :feature do
  let(:taxonomy) { create(:taxonomy, name: "Category") }
  let(:taxon) do
    create(:taxon, taxonomy: taxonomy, parent: taxonomy.root)
  end
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
  end

  describe "関連商品に関すること" do
    it "関連商品を5つ取得しても、商品を4つしか表示しないこと" do
      products.first(4).each do |product|
        expect(response.body).to include product.name
      end
      expect(response.body).not_to include products.fifth.name
    end

    it "関連商品にメイン商品が表示されてないこと" do
      within(".productContent") do
        expect(response.body).not_to include product.name
      end
    end
  end
  

end
