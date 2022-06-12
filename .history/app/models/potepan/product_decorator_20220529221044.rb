module Potepan::ProductDecorator
  def related_products
    Spree::Product.
    in_taxons(@product.taxons).
    includes(master: [:images, :default_price]).
    where.not(id: @product.id).
    distinct.
    limit(4)
  end
end
