class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :desc, :price, :status
end