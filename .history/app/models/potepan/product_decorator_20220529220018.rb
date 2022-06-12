def related_products

Spree::Product.includes(master:

[:default_price, images: [attachment_attachment: [:blob]]]).

in_taxons(taxons).

where.not(id: id).distinct

end



end
 @related_products = Spree::Product.in_taxons(@product.taxons).includes(master: [:images, :default_price]).where.not(id: @product.id).distinct.limit(4)
