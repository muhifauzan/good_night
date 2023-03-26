class User < ApplicationRecord
  has_many :sleeps

  attribute :name, :string

  validates :name, presence: true
end
