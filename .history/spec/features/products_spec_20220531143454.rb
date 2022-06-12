require 'rails_helper'

RSpec.feature "ProductsFeatures", type: :feature do
  let(:product) { create(:product, taxons: [taxon]) }
  let(:image) { create(:image) }
  let(:taxon) { create(:taxon) }
  let!(:filename) do
    filename = image.attachment_blob.filename
    "#{filename.base}#{filename.extension_with_delimiter}"
  end
  let(:products) { create_list(:product, 5, taxons: [taxon]) }

  before do
    product.images << image
    products.each { |product| product.images << create(:image) }
  end

  describe "タクソノミーに関すること" do
    before { visit potepan_product_path(product.id) }

    scenario "'一覧ページに戻る'のリンクで正しく遷移できること" do
      click_on '一覧ページへ戻る'
      expect(current_path).to eq potepan_category_path(product.taxons.first.id)
    end
  end

  describe "関連商品に関すること" do
    before { visit potepan_product_path(product.id) }

    scenario "関連商品の情報取得ができていること" do
      binding.pry
      products.first(4).each do |product|
        binding.pry
        click_on product.name
        expect(current_path).to eq potepan_product_path(product.id)

      end
    end
  end
end
