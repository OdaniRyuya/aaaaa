module Potepan::ProductDecorator
  def related_products
  binding.pry
    Spree::Product.where.not(id: id).in_taxons(:taxons).distinct.order(id: "ASC")
  end
  Spree::Product.prepend self
end
