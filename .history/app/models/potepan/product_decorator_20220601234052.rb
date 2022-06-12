module Potepan::ProductDecorator
  def related_products
  binding.pry
    Spree::Product.in_taxons(:taxons).where.not(id: id).distinct.order(id: "ASC")
  end
  Spree::Product.prepend self
end
