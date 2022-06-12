module Potepan::ProductDecorator
  def related_products
    Spree::Product.joins(:taxons)
                  .includes(master: [:default_price, :images])
                  .in_taxons(:taxons)
                  .where.not(id: id)
  end
  Spree::Product.prepend self
end
