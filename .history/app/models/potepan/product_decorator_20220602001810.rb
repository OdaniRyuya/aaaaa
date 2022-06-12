module Potepan::ProductDecorator
  def related_products
    Spree::Product.where.not(id: id).in_taxons(taxons).distinct
  end
  Spree::Product.prepend self
end
