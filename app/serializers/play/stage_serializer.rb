module Play
  class StageSerializer < ActiveModel::Serializer
    attributes :id, :order, :duration
    has_many :scenes, serializer: Play::SceneSerializer do
      object.scenes.sample(object.duration * 2)
    end
  end
end