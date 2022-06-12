class Potepan::ProductsController < ApplicationController
MAX_NUMBER_OF_RELATED_PRODUCTS = 4
def show
@product = Spree::Product.find(params[:id])
@images = @product.images.includes(attachment_attachment: [:blob])
@related_products = @product.related_products.
limit(MAX_NUMBER_OF_RELATED_PRODUCTS)
end
end
