class Potepan::ProductsController < ApplicationController
  RELATED_PRODUCTS_LIMIT = 4
  def show
  @product = Spree::Product.find(params[:id])
  @related_prodcts = @product.related_products.limit(RELATED_PRODUCTS_LIMIT)
  end
end
