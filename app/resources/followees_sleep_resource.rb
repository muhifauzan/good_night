class FolloweesSleepResource < SleepResource
  immutable

  filter :created_since, apply: ->(records, value, _options) {
    case value
        in ['last_week']
        now = Time.now.utc
        records.where(created_at: (now - 1.week)..now)
    else
      raise JSONAPI::Exceptions::InvalidFilterValue.new(:created_since, value)
    end
  }

  def self.records(opts = {})
    context = opts[:context]
    Sleep.of_friend_of_user(context[:user_id])
  end
end
