module Play
  class SceneSerializer < ActiveModel::Serializer
    attributes :id, :content
  end
end