class Sleep < ApplicationRecord
  belongs_to :user

  attribute :start_time, :datetime
  attribute :end_time, :datetime

  validates :user, presence: true
end
