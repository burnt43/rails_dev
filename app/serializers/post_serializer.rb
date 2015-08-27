class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :state
end
