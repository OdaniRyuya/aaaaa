module Potepan::ProductDecorator
  def related_products
    Spree::Product.where.not(id: id).in_taxons(:taxons).distinct.order(id: "ASC")
  end
  Spree::Product.prepend self
end
