class UserResource < JSONAPI::Resource
  has_many :sleeps
  has_many :followees

  attribute :name

  def self.default_sort
    [{ field: :created_at, direction: :desc }]
  end
end
