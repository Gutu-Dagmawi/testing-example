class Article < ApplicationRecord
  belongs_to :author, class_name: "User"
  validates :title, :body, presence: true
  validates :title, uniqueness: true
end
