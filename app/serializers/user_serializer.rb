class UserSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :id, :email, :created_at
end
