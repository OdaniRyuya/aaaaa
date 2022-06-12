class Potepan::CategoriesController < ApplicationController
  def show
  binding.pry
    @taxon = Spree::Taxon.find(params[:id])
    @products = Spree::Product.includes(master: [:images, :default_price]).in_taxon(@taxon)
    @taxonomies = Spree::Taxonomy.includes(:root)
  end
end
