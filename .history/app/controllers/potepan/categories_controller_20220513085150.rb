class Potepan::CategoriesController < ApplicationController
  def show
    @taxon = Spree::Taxon.where(params[:id])
    @taxonomies = Spree::Taxonomy.includes(:root)
  end
end
