class Potepan::ProductsController < ApplicationController
  RELATED_PRODUCTS_LIMIT_COUNT = 4

  def show
    @product = Spree::Product.find(params[:id])
    @related_products = @product.related_products.limit(RELATED_PRODUCTS_LIMIT_COUNT).includes(master: [:default_price, :images])
  end
end
