require 'rails_helper'



RSpec.describe 'Product', type: :model do
let(:taxon) { create(:taxon, taxonomy: taxonomy) }
let(:taxonomy) { create(:taxonomy) }
let(:product) { create(:product, taxons: [taxon]) }
let(:image) { create(:image) }
let(:related_products) { create_list(:product, 4, taxons: [taxon]) }
before do
product.images << image
related_products.each do |related_product|
related_product.images << create(:image)
end
end
it '表示される商品が重複しないこと' do
binding.pry
expect(product.related_products).to eq related_products.uniq
end
end

