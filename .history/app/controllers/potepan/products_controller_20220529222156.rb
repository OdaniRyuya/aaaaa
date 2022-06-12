class Potepan::ProductsController < ApplicationController
  MAX_RELATED_PRODUCTS_COUNT = 4
  def show
    @product = Spree::Product.find(params[:id])
    @related_products = @product.related_products.take(MAX_RELATED_PRODUCTS_COUNT)
  end
end
