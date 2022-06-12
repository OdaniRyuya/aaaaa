require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:product) { create(:product) }
  let(:image) { create(:image) }
  let(:taxon) { create(:taxon) }

  before do
    product.images << image
  end

  describe "商品詳細ページ" do
  end

end
