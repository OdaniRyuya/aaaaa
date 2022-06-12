class Potepan::ProductsController < ApplicationController
  RELATED_PRODUCTS_LIMIT = 4
  def show
  @product = Spree::Product.find(params[:id])

  end
end
