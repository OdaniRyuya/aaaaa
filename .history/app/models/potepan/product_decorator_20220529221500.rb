module Potepan::ProductDecorator
def related_products
Spree::Product.includes(master:
[:default_price, images: [attachment_attachment: [:blob]]]).
in_taxons(taxons).
where.not(id: id).distinct
end
end
