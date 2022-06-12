class Potepan::CategoriesController < ApplicationController
  def show
    @taxon = Spree::Taxon.find(params[:id])
    @taxon_products = Spree::Taxon.where(id: params[:id])
    binding.pry
    @taxonomies = Spree::Taxonomy.includes(:root)
  end
end
