module Potepan::ProductDecorator
  def related_products
    Spree::Product.joins(:taxons)
                  .includes(master: [:default_price, :images])

                  .distinct
                  .in_taxons(:taxons)
                  .where.not(id: id)
                  .order(:taxon_id)
  end
  Spree::Product.prepend self
end
