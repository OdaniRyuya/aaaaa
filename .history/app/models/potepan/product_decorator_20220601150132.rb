module Potepan::ProductDecorator
  def related_products
    Spree::Product.in_taxons(:taxons).where.not(id: id)
  end
  Spree::Product.prepend self
end
