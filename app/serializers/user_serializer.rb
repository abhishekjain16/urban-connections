class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :type, :created_at, :email, :username, :access_token, :status, :phone
end
