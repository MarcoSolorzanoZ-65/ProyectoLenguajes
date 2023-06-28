json.array! @menus do |menu|
  json.id menu.id
  json.name menu.name
  json.products menu.products do |product|
    json.id product.id
    json.name product.name
    json.desc product.desc
    json.price product.price
    json.status product.status
  end
end

