class User < ApplicationRecord
  attribute :name, :string

  validates :name, presence: true
end
