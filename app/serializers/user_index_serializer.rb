class UserIndexSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at
  belongs_to :category
end
