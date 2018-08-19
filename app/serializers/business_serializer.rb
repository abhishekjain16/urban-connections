class BusinessSerializer < ActiveModel::Serializer
  attributes :id, :name, :minimum_order_charge, :service_charge, :website
  belongs_to :owner
end
