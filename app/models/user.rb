class User < ApplicationRecord
  has_many :sleeps

  has_many :followee_relationships, class_name: 'UsersFollow', foreign_key: :follower_id
  has_many :followees, through: :followee_relationships, source: :followee

  attribute :name, :string

  validates :name, presence: true
end
