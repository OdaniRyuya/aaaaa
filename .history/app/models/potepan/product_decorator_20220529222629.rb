module Potepan::ProductDecorator
  def related_products
    Spree::Product.includes(master: [:default_price, :images])
                  .distinct
                  .in_taxons(:taxons)
                  .where.not(id: id)
  end
  Spree::Product.prepend self
end
