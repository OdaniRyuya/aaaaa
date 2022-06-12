module Potepan::ProductDecorator
  def related_products
    Spree::Product.includes(master: 
    [:images, :default_price]).
    in_taxons(taxons).
    where.not(id: id).distinct
  end
end
