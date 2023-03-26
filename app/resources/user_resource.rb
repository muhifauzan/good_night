class UserResource < JSONAPI::Resource
  attribute :name

  def self.default_sort
    [{ field: :created_at, direction: :desc }]
  end
end
