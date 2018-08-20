class RentSerializer < ActiveModel::Serializer
  attributes :to, :from
  belongs_to :user
  belongs_to :book
end
