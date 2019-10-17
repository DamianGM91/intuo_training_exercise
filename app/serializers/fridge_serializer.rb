class FridgeSerializer < ActiveModel::Serializer
  attributes :id, :brand, :last_technical_check, :owner_id
  # belongs_to :user
end
