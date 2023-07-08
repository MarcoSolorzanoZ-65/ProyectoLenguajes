class UserSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :email, :created_at
  belongs_to :category
end
