class Sleep < ApplicationRecord
  belongs_to :user

  before_save :maybe_fill_duration

  attribute :start_time, :datetime
  attribute :end_time, :datetime
  attribute :duration, :time

  validates :user, presence: true

  scope :of_friend_of_user, ->(user_id) {
    return unless user_id

    ids = User.find(user_id).followees.pluck(:id)
    where(user_id: ids)
  }

  private

  def maybe_fill_duration
    return unless start_time && end_time

    time_diff = end_time - start_time
    self.duration = Time.at(time_diff).utc.strftime('%T')
  end
end
