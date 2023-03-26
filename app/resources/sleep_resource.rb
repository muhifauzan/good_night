class SleepResource < JSONAPI::Resource
  attribute :user_id
  attribute :start_time
  attribute :end_time
  attribute :duration

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

  def duration
    return unless @model.end_time

    time_diff = @model.end_time - @model.start_time
    Time.at(time_diff).utc.strftime('%T')
  end
end
