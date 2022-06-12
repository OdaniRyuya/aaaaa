Spree::Product.class_eval do
def related_products(limit_num)
  Spree::Product.
    in_taxons(@product.taxons).
    includes(master: [:images, :default_price]).
    where.not(id: @product.id).
    distinct.
    limit(limit_num)
  end
end
