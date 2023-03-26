class SleepResource < JSONAPI::Resource
  attribute :user_id
  attribute :start_time
  attribute :end_time
  attribute :duration

  filter :created_since, apply: ->(records, value, _options) {
    case value
    in ['last_week']
      now = Time.now.utc
      records.where(created_at: (now - 1.week)..now)
    else
      raise JSONAPI::Exceptions::InvalidFilterValue.new(:created_since, value)
    end
  }

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
    @model.duration&.strftime('%T')
  end
end
