class Potepan::CategoriesController < ApplicationController
  def show
    @taxon = Spree::Taxon.find(params[:id])
    @products = Spree::Product.includes(master: [:images, :default_price]).in_taxon(@taxon)
    @taxonomy = Spree::Taxonomy.includes(:root)
  end
end
