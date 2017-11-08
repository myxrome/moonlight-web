module Play
  class ScenarioSerializer < ActiveModel::Serializer
    attributes :id, :title, :description
    has_many :stages, serializer: Play::StageSerializer
  end
end