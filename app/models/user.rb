class User < ApplicationRecord
  has_many :articles, foreign_key: :author_id
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: minimum(6)
end
