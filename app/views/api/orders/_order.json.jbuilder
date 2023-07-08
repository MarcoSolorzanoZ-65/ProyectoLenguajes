json.id @order.id
json.order_status @order.order_status
json.order_name @order.order_name

json.products @order.products do |product|
  json.id product.id
  json.name product.name
  json.desc product.desc
  json.price product.price
  json.status product.status
end
