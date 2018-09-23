json.id carted_product.id
json.order_id carted_product.order_id
json.status carted_product.status
json.quantity carted_product.quantity

json.carted_product do
  json.partial! carted_product, partial: 'api/products/product', as: :product
end