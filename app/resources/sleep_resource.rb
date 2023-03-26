class SleepResource < JSONAPI::Resource
  attribute :user_id
  attribute :start_time
  attribute :end_time

  def self.default_sort
    [{ field: :created_at, direction: :desc }]
  end

  def self.creatable_fields(_context)
    [:user_id, :start_time]
  end

  def self.updatable_fields(_context)
    [:end_time]
  end

  def fetchable_fields
    super - [:user_id]
  end
end
