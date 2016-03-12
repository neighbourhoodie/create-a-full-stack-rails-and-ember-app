class NoteSerializer < ActiveModel::Serializer
  attributes :id, :type, :title, :description, :created_at
  has_one :topic
end
