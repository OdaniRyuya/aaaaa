module Potepan::ProductDecorator
  def related_products
    Spree::Product.
    in_taxons(taxons).
    includes(master: [:images, :default_price]).
    where.not(id: id).
    distinct
  end
end
