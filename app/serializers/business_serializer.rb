class BusinessSerializer < ActiveModel::Serializer
  attributes :id, :name, :minimum_order_charge, :service_charge, :website, :yelp_id
  belongs_to :owner
end
